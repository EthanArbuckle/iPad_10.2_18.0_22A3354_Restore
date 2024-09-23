@implementation CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum

- (CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum;
  return (CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum *)-[CCRepeatedFieldValue _init](&v3, sel__init);
}

- (void)appendRawEnumValue:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[CCRepeatedFieldValue values](self, "values");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)appendEnumValue:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[CCRepeatedFieldValue values](self, "values");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CCMutableSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum;
  return objc_msgSendSuper2(&v3, sel__new);
}

@end
