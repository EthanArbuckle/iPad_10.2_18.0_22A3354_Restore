@implementation WFContentLibraryFiltering

+ (void)performFallbackFilteringWithItems:(id)a3 withContentPredicates:(id)a4 compoundPredicateType:(unint64_t)a5 originalQuery:(id)a6 resultHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  WFContentCompoundPredicate *v14;
  WFContentQuery *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  if (objc_msgSend(v11, "count"))
    v14 = -[WFContentCompoundPredicate initWithType:subpredicates:]([WFContentCompoundPredicate alloc], "initWithType:subpredicates:", a5, v11);
  else
    v14 = 0;
  v15 = -[WFContentQuery initWithPredicate:]([WFContentQuery alloc], "initWithPredicate:", v14);
  if (v12)
  {
    objc_msgSend(v12, "sortDescriptors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentQuery setSortDescriptors:](v15, "setSortDescriptors:", v16);

    v17 = objc_msgSend(v12, "slice");
    -[WFContentQuery setSlice:](v15, "setSlice:", v17, v18);
    objc_msgSend(v12, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentQuery setUserInfo:](v15, "setUserInfo:", v19);

  }
  -[WFContentQuery runWithObjects:completionHandler:](v15, "runWithObjects:completionHandler:", v20, v13);

}

+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 compoundPredicate:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v12, "subpredicates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compoundPredicateType");

  if (objc_msgSend(v13, "count") == 1
    && (unint64_t)(v14 - 1) <= 1
    && (objc_msgSend(v13, "firstObject"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v13, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getItemsMatchingQuery:withInput:compoundPredicate:resultHandler:", v18, v10, v17, v11);

  }
  else
  {
    objc_msgSend(a1, "performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:withInput:resultHandler:", v13, v14, v18, v10, v11);
  }

}

+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
  }
  else
  {
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentCompoundPredicate andPredicateWithSubpredicates:](WFContentCompoundPredicate, "andPredicateWithSubpredicates:", v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "getItemsMatchingQuery:withInput:compoundPredicate:resultHandler:", v8, v9, v12, v10);

}

+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7
{
  (*((void (**)(id, _QWORD, _QWORD))a7 + 2))(a7, 0, 0);
}

@end
