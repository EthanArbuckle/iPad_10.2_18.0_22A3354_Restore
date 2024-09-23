@implementation MRTransactionPacketAccumulator

- (MRTransactionPacketAccumulator)init
{
  MRTransactionPacketAccumulator *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *packets;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRTransactionPacketAccumulator;
  v2 = -[MRTransactionPacketAccumulator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    packets = v2->_packets;
    v2->_packets = v3;

  }
  return v2;
}

- (id)mergePacket:(id)a3
{
  id v5;
  uint64_t v6;
  NSMutableOrderedSet *packets;
  unint64_t currentLength;
  NSMutableOrderedSet *v9;
  MRTransactionPacket *v10;
  void *v12;
  _QWORD v13[6];

  v5 = a3;
  v6 = objc_msgSend(v5, "actualLength");
  packets = self->_packets;
  self->_currentLength += v6;
  -[NSMutableOrderedSet addObject:](packets, "addObject:", v5);
  currentLength = self->_currentLength;
  if (currentLength > objc_msgSend(v5, "totalLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 196, CFSTR("Current Length greater than total length"));

  }
  if (objc_msgSend(v5, "totalLength") == self->_currentLength)
  {
    v9 = self->_packets;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__MRTransactionPacketAccumulator_mergePacket___block_invoke;
    v13[3] = &unk_1E30CCEB8;
    v13[4] = self;
    v13[5] = a2;
    -[NSMutableOrderedSet sortUsingComparator:](v9, "sortUsingComparator:", v13);
    v10 = -[MRTransactionPacket initWithPackets:]([MRTransactionPacket alloc], "initWithPackets:", self->_packets);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __46__MRTransactionPacketAccumulator_mergePacket___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "totalWritePosition");
  if (v7 == objc_msgSend(v6, "totalWritePosition"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MRTransaction.m"), 201, CFSTR("Duplicate total write positions %ld"), objc_msgSend(v5, "totalWritePosition"));

  }
  v8 = objc_msgSend(v5, "totalWritePosition");
  if (v8 > objc_msgSend(v6, "totalWritePosition"))
    v9 = 1;
  else
    v9 = -1;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packets, 0);
}

@end
