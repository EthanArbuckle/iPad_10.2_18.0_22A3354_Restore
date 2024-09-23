@implementation CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum

- (void)enumerateEnumValuesWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __94__CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum_enumerateEnumValuesWithBlock___block_invoke;
  v6[3] = &unk_251030AE0;
  v7 = v4;
  v5 = v4;
  -[CCRepeatedUInt32 enumerateUInt32ValuesWithBlock:](self, "enumerateUInt32ValuesWithBlock:", v6);

}

uint64_t __94__CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum_enumerateEnumValuesWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2 >= 6)
    a2 = 0;
  else
    a2 = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, a2);
}

@end
