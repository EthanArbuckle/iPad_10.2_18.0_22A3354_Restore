@implementation MAAutoAssetControlStatisticsBySize

- (MAAutoAssetControlStatisticsBySize)init
{
  return -[MAAutoAssetControlStatisticsBySize initWithInitialValue:](self, "initWithInitialValue:", 0);
}

- (MAAutoAssetControlStatisticsBySize)initWithInitialValue:(int64_t)a3
{
  MAAutoAssetControlStatisticsBySize *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MAAutoAssetControlStatisticsBySize;
  result = -[MAAutoAssetControlStatisticsBySize init](&v5, sel_init);
  if (result)
  {
    result->_patchedAssets = a3;
    result->_patchedBytes = a3;
    result->_fullAssets = a3;
    result->_fullBytes = a3;
  }
  return result;
}

- (MAAutoAssetControlStatisticsBySize)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetControlStatisticsBySize *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAutoAssetControlStatisticsBySize;
  v5 = -[MAAutoAssetControlStatisticsBySize init](&v7, sel_init);
  if (v5)
  {
    v5->_patchedAssets = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("patchedAssets"));
    v5->_patchedBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("patchedBytes"));
    v5->_fullAssets = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fullAssets"));
    v5->_fullBytes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fullBytes"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"), CFSTR("patchedAssets"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"), CFSTR("patchedBytes"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"), CFSTR("fullAssets"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[MAAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"), CFSTR("fullBytes"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetControlStatisticsBySize *v3;

  v3 = objc_alloc_init(MAAutoAssetControlStatisticsBySize);
  -[MAAutoAssetControlStatisticsBySize setPatchedAssets:](v3, "setPatchedAssets:", -[MAAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"));
  -[MAAutoAssetControlStatisticsBySize setPatchedBytes:](v3, "setPatchedBytes:", -[MAAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"));
  -[MAAutoAssetControlStatisticsBySize setFullAssets:](v3, "setFullAssets:", -[MAAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"));
  -[MAAutoAssetControlStatisticsBySize setFullBytes:](v3, "setFullBytes:", -[MAAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(">>>\n   patchedAssets: %lld\n    patchedBytes: %lld\n      fullAssets: %lld\n       fullBytes: %lld\n<<<]"), -[MAAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"), -[MAAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"), -[MAAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"), -[MAAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
}

- (id)summary
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[patchedAssets:%lld,patchedBytes:%lld,fullAssets:%lld,fullBytes:%lld]"), -[MAAutoAssetControlStatisticsBySize patchedAssets](self, "patchedAssets"), -[MAAutoAssetControlStatisticsBySize patchedBytes](self, "patchedBytes"), -[MAAutoAssetControlStatisticsBySize fullAssets](self, "fullAssets"), -[MAAutoAssetControlStatisticsBySize fullBytes](self, "fullBytes"));
}

- (int64_t)patchedAssets
{
  return self->_patchedAssets;
}

- (void)setPatchedAssets:(int64_t)a3
{
  self->_patchedAssets = a3;
}

- (int64_t)patchedBytes
{
  return self->_patchedBytes;
}

- (void)setPatchedBytes:(int64_t)a3
{
  self->_patchedBytes = a3;
}

- (int64_t)fullAssets
{
  return self->_fullAssets;
}

- (void)setFullAssets:(int64_t)a3
{
  self->_fullAssets = a3;
}

- (int64_t)fullBytes
{
  return self->_fullBytes;
}

- (void)setFullBytes:(int64_t)a3
{
  self->_fullBytes = a3;
}

@end
