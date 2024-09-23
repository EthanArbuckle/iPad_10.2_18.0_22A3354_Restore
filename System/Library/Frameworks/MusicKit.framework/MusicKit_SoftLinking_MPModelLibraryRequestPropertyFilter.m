@implementation MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter

- (MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter)initWithKeys:(id)a3 value:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  _MPModelLibraryRequestPropertyFilter *underlyingPropertyFilter;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter;
  v10 = -[MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend((id)objc_opt_class(), "_underlyingComparisonTypeForComparisonType:", a5);
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v12 = (void *)get_MPModelLibraryRequestPropertyFilterClass_softClass;
    v22 = get_MPModelLibraryRequestPropertyFilterClass_softClass;
    if (!get_MPModelLibraryRequestPropertyFilterClass_softClass)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __get_MPModelLibraryRequestPropertyFilterClass_block_invoke;
      v18[3] = &unk_24CD1CC68;
      v18[4] = &v19;
      __get_MPModelLibraryRequestPropertyFilterClass_block_invoke((uint64_t)v18);
      v12 = (void *)v20[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v19, 8);
    v14 = objc_msgSend([v13 alloc], "initWithKeys:value:comparisonType:", v8, v9, v11);
    underlyingPropertyFilter = v10->_underlyingPropertyFilter;
    v10->_underlyingPropertyFilter = (_MPModelLibraryRequestPropertyFilter *)v14;

  }
  return v10;
}

- (id)_underlyingPropertyFilter
{
  return self->_underlyingPropertyFilter;
}

+ (int64_t)_underlyingComparisonTypeForComparisonType:(int64_t)a3
{
  return a3 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPropertyFilter, 0);
}

@end
