@implementation NSDictionary

void __56__NSDictionary_Intents___intents_indexingRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "_intents_indexingRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __45__NSDictionary_Intents__descriptionAtIndent___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6] + 1;
  v7 = a2;
  objc_msgSend(a3, "descriptionAtIndent:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@    %@ = %@;"), v5, v7, v8);

}

@end
