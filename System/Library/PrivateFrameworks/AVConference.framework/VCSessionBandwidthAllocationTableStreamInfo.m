@implementation VCSessionBandwidthAllocationTableStreamInfo

- (VCSessionBandwidthAllocationTableStreamInfo)init
{
  VCSessionBandwidthAllocationTableStreamInfo *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCSessionBandwidthAllocationTableStreamInfo;
  v2 = -[VCSessionBandwidthAllocationTableStreamInfo init](&v4, sel_init);
  if (v2)
  {
    v2->_sortedEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_qualityIndexToTableEntry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionBandwidthAllocationTableStreamInfo;
  -[VCSessionBandwidthAllocationTableStreamInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)addTableEntry:(id)a3
{
  uint64_t v5;

  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_qualityIndexToTableEntry, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "qualityIndex")));
  if (!v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_qualityIndexToTableEntry, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "qualityIndex")));
    -[NSMutableArray addObject:](self->_sortedEntries, "addObject:", a3);
    -[NSMutableArray sortUsingComparator:](self->_sortedEntries, "sortUsingComparator:", &__block_literal_global_103);
  }
  return v5 == 0;
}

uint64_t __61__VCSessionBandwidthAllocationTableStreamInfo_addTableEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  unsigned int v7;

  v5 = objc_msgSend(a2, "qualityIndex");
  if (v5 < objc_msgSend(a3, "qualityIndex"))
    return -1;
  v7 = objc_msgSend(a2, "qualityIndex");
  return v7 > objc_msgSend(a3, "qualityIndex");
}

- (id)entryForQualityIndex:(unsigned int)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_qualityIndexToTableEntry, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (NSArray)sortedEntries
{
  return &self->_sortedEntries->super;
}

- (NSMutableDictionary)qualityIndexToTableEntry
{
  return self->_qualityIndexToTableEntry;
}

@end
