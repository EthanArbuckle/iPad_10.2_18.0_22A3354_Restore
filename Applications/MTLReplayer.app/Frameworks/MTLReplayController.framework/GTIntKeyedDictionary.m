@implementation GTIntKeyedDictionary

id __40__GTIntKeyedDictionary_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", a3, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2));
}

id __38__GTIntKeyedDictionary_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = objc_msgSend(a2, "longLongValue");
  v5 = objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v4), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v3));
  if (!v5)
    __assert_rtn("-[GTIntKeyedDictionary initWithCoder:]_block_invoke", ", 0, "obj");
  return objc_msgSend(*(id *)(a1 + 40), "setObject:forIntKey:", v5, v3);
}

id __51__GTIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forIntKey:", a3, a2);
}

@end
