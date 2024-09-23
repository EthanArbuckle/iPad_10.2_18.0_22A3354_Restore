@implementation AVCAudioPowerSpectrumChannel

- (AVCAudioPowerSpectrumChannel)init
{
  AVCAudioPowerSpectrumChannel *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCAudioPowerSpectrumChannel;
  v2 = -[AVCAudioPowerSpectrumChannel init](&v4, sel_init);
  if (v2)
    v2->_bins = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCAudioPowerSpectrumChannel;
  -[AVCAudioPowerSpectrumChannel dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_bins, CFSTR("bins"));
}

- (AVCAudioPowerSpectrumChannel)initWithCoder:(id)a3
{
  AVCAudioPowerSpectrumChannel *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AVCAudioPowerSpectrumChannel;
  v4 = -[AVCAudioPowerSpectrumChannel init](&v6, sel_init);
  if (v4)
    v4->_bins = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("bins"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)bins
{
  return &self->_bins->super;
}

- (void)applyChannelBins:(_VCAudioPowerSpectrumEntry *)a3 binCount:(unsigned int)a4
{
  unint64_t v6;
  unint64_t v7;
  AVCAudioPowerSpectrumBin *v8;

  if (a4)
  {
    v6 = 0;
    v7 = a4;
    do
    {
      if (-[NSMutableArray count](self->_bins, "count") <= v6)
      {
        v8 = objc_alloc_init(AVCAudioPowerSpectrumBin);
        -[NSMutableArray addObject:](self->_bins, "addObject:", v8);

      }
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v6++), "assign:", a3++);
    }
    while (v7 != v6);
  }
  else
  {
    v7 = 0;
  }
  if (-[NSMutableArray count](self->_bins, "count") > v7)
    -[NSMutableArray removeObjectsInRange:](self->_bins, "removeObjectsInRange:", v7, -[NSMutableArray count](self->_bins, "count") - v7);
}

@end
