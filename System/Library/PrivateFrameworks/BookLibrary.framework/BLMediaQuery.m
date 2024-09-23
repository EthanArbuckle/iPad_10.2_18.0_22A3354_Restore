@implementation BLMediaQuery

+ (MPMediaQuery)audiobooksQuery
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = sub_2132408CC();
  return (MPMediaQuery *)objc_msgSend_audiobooksQuery(v2, v3, v4);
}

+ (MPMediaQuery)audiobooksNonPreordersQuery
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = sub_2132408CC();
  objc_msgSend_audiobooksQuery(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_213243698();
  v7 = *MEMORY[0x24BDDBBF0];
  if ((objc_msgSend_canFilterByProperty_(v6, v8, *MEMORY[0x24BDDBBF0]) & 1) != 0
    || (v9 = sub_2132437A4(), (objc_msgSend_canFilterByProperty_(v9, v10, v7) & 1) != 0))
  {
    v11 = sub_2132438B0();
    objc_msgSend_predicateWithValue_forProperty_(v11, v12, (uint64_t)&unk_24CF72CE8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addFilterPredicate_(v5, v14, (uint64_t)v13);

  }
  else
  {
    BLDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_21323F000, v15, OS_LOG_TYPE_ERROR, "MPMediaPropertyPredicate cannot filter using the %@ property.", (uint8_t *)&v17, 0xCu);
    }

  }
  return (MPMediaQuery *)v5;
}

@end
