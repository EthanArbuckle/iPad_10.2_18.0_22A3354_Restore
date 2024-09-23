@implementation HMBMirrorOutputGroup

- (HMBMirrorOutputGroup)initWithBlockRow:(unint64_t)a3 options:(id)a4
{
  id v7;
  HMBMirrorOutputGroup *v8;
  HMBMirrorOutputGroup *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBMirrorOutputGroup;
  v8 = -[HMBMirrorOutputGroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_blockRow = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMBMirrorOutputGroup blockRow](self, "blockRow");
  -[HMBMirrorOutputGroup options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMBLocalZoneOutputRecords: %lu options: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMBProcessingOptions)options
{
  return self->_options;
}

- (unint64_t)blockRow
{
  return self->_blockRow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
