@implementation FSVolume

- (FSVolume)initWithVolumeID:(id)a3 volumeName:(id)a4
{
  id v7;
  id v8;
  FSVolume *v9;
  FSVolume *v10;
  uint64_t v11;
  OS_dispatch_queue *globalWorkQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSVolume;
  v9 = -[FSVolume init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_volumeID, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    dispatch_get_global_queue(2, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    globalWorkQueue = v10->_globalWorkQueue;
    v10->_globalWorkQueue = (OS_dispatch_queue *)v11;

  }
  return v10;
}

- (void)dealloc
{
  OS_dispatch_queue *renameWorkQueue;
  objc_super v4;

  renameWorkQueue = self->_renameWorkQueue;
  self->_renameWorkQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)FSVolume;
  -[FSVolume dealloc](&v4, sel_dealloc);
}

- (OS_dispatch_queue)renameWorkQueue
{
  FSVolume *v2;
  OS_dispatch_queue *renameWorkQueue;
  dispatch_queue_t v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  v2 = self;
  objc_sync_enter(v2);
  renameWorkQueue = v2->_renameWorkQueue;
  if (!renameWorkQueue)
  {
    v4 = dispatch_queue_create("com.apple.fskit.rename.queue", 0);
    v5 = v2->_renameWorkQueue;
    v2->_renameWorkQueue = (OS_dispatch_queue *)v4;

    renameWorkQueue = v2->_renameWorkQueue;
  }
  v6 = renameWorkQueue;
  objc_sync_exit(v2);

  return v6;
}

- (void)setRenameWorkQueue:(id)a3
{
  FSVolume *v5;
  OS_dispatch_queue *v6;
  id v7;

  v7 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_renameWorkQueue;
  objc_storeStrong((id *)&v5->_renameWorkQueue, a3);
  if (v6)

  objc_sync_exit(v5);
}

- (FSVolumeIdentifier)volumeID
{
  return (FSVolumeIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVolumeID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FSFileName)name
{
  return (FSFileName *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)wasTerminated
{
  return self->_wasTerminated;
}

- (void)setWasTerminated:(BOOL)a3
{
  self->_wasTerminated = a3;
}

- (OS_dispatch_queue)globalWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGlobalWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalWorkQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_volumeID, 0);
  objc_storeStrong((id *)&self->_renameWorkQueue, 0);
}

- (id)queueForItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "queue");
  else
    -[FSVolume globalWorkQueue](self, "globalWorkQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)newDirEntryPacker:(void *)a3 bufLen:(unint64_t)a4 bytesPacked:(unint64_t *)a5 withAttr:(BOOL)a6
{
  void *v6;
  void *v7;
  _QWORD aBlock[9];
  _QWORD v10[4];
  _QWORD v11[3];
  BOOL v12;
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = a5;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = a6;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__FSVolume_Project__newDirEntryPacker_bufLen_bytesPacked_withAttr___block_invoke;
  aBlock[3] = &unk_250C32440;
  aBlock[4] = v11;
  aBlock[5] = v15;
  aBlock[6] = v14;
  aBlock[7] = v13;
  aBlock[8] = v10;
  v6 = _Block_copy(aBlock);
  v7 = _Block_copy(v6);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  return v7;
}

uint64_t __67__FSVolume_Project__newDirEntryPacker_bufLen_bytesPacked_withAttr___block_invoke(_QWORD *a1, void *a2, char a3, uint64_t a4, uint64_t a5, void *a6, int a7)
{
  id v13;
  id v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  int v34;
  int v35;

  v13 = a2;
  v14 = a6;
  objc_msgSend(v13, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    if (!v14)
    {
      v21 = 0;
      goto LABEL_22;
    }
    v17 = ((_DWORD)v16 + 208) & 0xFFFFFFF8;
    v18 = **(_QWORD **)(*(_QWORD *)(a1[5] + 8) + 24);
    if ((unint64_t)(v18 + v17) > *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 8) = 0;
LABEL_7:
      v21 = 1;
      goto LABEL_22;
    }
    v35 = a7;
    v22 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) + v18;
    objc_msgSend(v14, "getLIAttributes:", v22 + 16);
    objc_msgSend(v13, "data");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    memcpy((void *)(v22 + 200), (const void *)objc_msgSend(v23, "bytes"), v16);

    v21 = 0;
    *(_BYTE *)(v22 + 200 + v16) = 0;
    *(_WORD *)(v22 + 10) = 200;
    *(_WORD *)(v22 + 12) = v16;
    if (v35)
      v24 = 0;
    else
      v24 = (v16 + 208) & 0xFFF8;
    *(_WORD *)(v22 + 8) = v24;
    if (v35)
      v25 = -1;
    else
      v25 = a5;
    *(_QWORD *)v22 = v25;
    v26 = *(_QWORD **)(*(_QWORD *)(a1[5] + 8) + 24);
    *v26 += v17;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v22;
  }
  else
  {
    v34 = a7;
    v19 = (v16 + 29) & 0xFFFFFFFFFFFFFFF8;
    v20 = **(_QWORD **)(*(_QWORD *)(a1[5] + 8) + 24);
    if (v20 + v19 > *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + 16) = 0;
      goto LABEL_7;
    }
    v33 = a5;
    v27 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) + v20;
    objc_msgSend(v13, "data");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    memcpy((void *)(v27 + 21), (const void *)objc_msgSend(v28, "bytes"), v16);

    v21 = 0;
    *(_BYTE *)(v27 + 21 + v16) = 0;
    *(_WORD *)(v27 + 18) = v16;
    *(_BYTE *)(v27 + 20) = a3;
    if (v34)
      v29 = 0;
    else
      v29 = (v16 + 29) & 0xFFF8;
    *(_WORD *)(v27 + 16) = v29;
    v30 = v33;
    if (v34)
      v30 = -1;
    *(_QWORD *)v27 = a4;
    *(_QWORD *)(v27 + 8) = v30;
    v31 = *(_QWORD **)(*(_QWORD *)(a1[5] + 8) + 24);
    *v31 += v19;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v27;
  }
LABEL_22:

  return v21;
}

+ (id)extentPackerForBuffer:(void *)a3 bufLen:(unint64_t)a4 extentCount:(unsigned int *)a5
{
  void *v5;
  void *v6;
  _QWORD v8[8];
  _QWORD v9[4];
  _QWORD v10[3];
  int v11;
  _QWORD v12[4];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = a5;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__FSVolume_Project__extentPackerForBuffer_bufLen_extentCount___block_invoke;
  v8[3] = &unk_250C32468;
  v8[4] = v10;
  v8[5] = v9;
  v8[6] = v12;
  v8[7] = a3;
  v5 = _Block_copy(v8);
  v6 = _Block_copy(v5);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  return v6;
}

BOOL __62__FSVolume_Project__extentPackerForBuffer_bufLen_extentCount___block_invoke(_QWORD *a1, void *a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _DWORD *v16;

  v6 = *(unsigned int *)(*(_QWORD *)(a1[4] + 8) + 24) + 24;
  v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v6 <= v7)
  {
    v13 = a1[7] + 24 * **(unsigned int **)(*(_QWORD *)(a1[6] + 8) + 24);
    v14 = objc_msgSend(a2, "fileDescriptor");
    if (a3)
      v15 = 0x2000000;
    else
      v15 = 0x1000000;
    *(_DWORD *)v13 = v15 & 0xFF000000 | v14 & 0xFFFFFF;
    *(_DWORD *)(v13 + 4) = a6;
    *(_QWORD *)(v13 + 8) = a5;
    *(_QWORD *)(v13 + 16) = a4;
    v16 = *(_DWORD **)(*(_QWORD *)(a1[6] + 8) + 24);
    ++*v16;
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += 24;
  }
  return v6 > v7;
}

+ (id)volumeIdentifierDescription:(id)a3
{
  return (id)objc_msgSend(a3, "debugDescription");
}

@end
