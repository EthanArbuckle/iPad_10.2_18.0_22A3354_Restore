@implementation PrettyDescriptionBuilder

+ (id)buildDescriptionOf:(id)a3
{
  return objc_msgSend(a1, "describeComplexObject:withName:withDepth:", a3, 0, 0);
}

+ (id)describeComplexObject:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v17;
  objc_property_t *v18;
  uint64_t v19;
  objc_property *v20;
  NSString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  unsigned int outCount;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeSimpleObject:withName:withDepth:", v8, v9, a5));
  v11 = v10;
  if (!v10)
  {
    v13 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeArray:withName:withDepth:", v8, v9, a5));
      goto LABEL_7;
    }
    v14 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeDictionary:withName:withDepth:", v8, v9, a5));
      goto LABEL_7;
    }
    v31 = a5;
    outCount = 0;
    v17 = (objc_class *)objc_opt_class(v8);
    v18 = class_copyPropertyList(v17, &outCount);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (!outCount)
    {
LABEL_23:
      free(v18);
      v30 = +[PrettyPropertyDescription describingPropertyNamed:withClassType:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassType:andValue:andRecursiveDepth:", v9, objc_opt_class(v8), v33, v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v30);

      goto LABEL_8;
    }
    v19 = 0;
    v32 = v31 + 1;
    while (1)
    {
      v20 = v18[v19];
      v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", property_getName(v20), 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extractValueFrom:belongingTo:", v20, v8));
      v24 = objc_opt_class(v23);
      if (v24 != objc_opt_class(NSObject))
        break;
LABEL_20:

      if (++v19 >= (unint64_t)outCount)
        goto LABEL_23;
    }
    if (v23)
    {
      if (v23 == v8)
      {
        v25 = (id)objc_opt_class(v8);
        v26 = v22;
        v27 = CFSTR("[Self reference, parsing abandoned]");
      }
      else
      {
        if (v31 < 0xF)
        {
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeComplexObject:withName:withDepth:", v23, v22, v32));
          goto LABEL_19;
        }
        v25 = (id)objc_opt_class(v23);
        v26 = v22;
        v27 = CFSTR("[Possible infinite recurrsion detected, parsing abandoned]");
      }
    }
    else
    {
      v25 = objc_msgSend(a1, "extractClassFrom:", v20);
      v26 = v22;
      v27 = CFSTR("(null)");
    }
    v28 = objc_claimAutoreleasedReturnValue(+[PrettyPropertyDescription describingPropertyNamed:withClassType:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassType:andValue:andRecursiveDepth:", v26, v25, v27, v32, v31));
LABEL_19:
    v29 = (void *)v28;
    objc_msgSend(v33, "addObject:", v28, v31);

    goto LABEL_20;
  }
  v12 = v10;
LABEL_7:
  v15 = v12;
LABEL_8:

  return v15;
}

+ (id)extractValueFrom:(objc_property *)a3 belongingTo:(id)a4
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", property_getName(a3), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v7));

  return v8;
}

+ (Class)extractClassFrom:(objc_property *)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  Class v9;
  void *v10;

  v3 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", property_getAttributes(a3), 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(",")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 3, (char *)objc_msgSend(v7, "length") - 4));

  v9 = NSClassFromString(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return (Class)v10;
}

+ (id)describeSimpleObject:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  objc_class *v15;
  NSString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = +[PrettyPropertyDescription describingPropertyNamed:withClassType:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassType:andValue:andRecursiveDepth:", v8, objc_opt_class(NSString), v7, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    goto LABEL_50;
  }
  v12 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
  {
    v13 = objc_retainAutorelease(v7);
    v14 = (const char *)objc_msgSend(v13, "objCType");
    if (!strcmp(v14, "B"))
    {
      v17 = CFSTR("BOOL");
    }
    else if (!strcmp(v14, "c"))
    {
      v17 = CFSTR("char");
    }
    else if (!strcmp(v14, "{?=b8b4b1b1b18[8S]}"))
    {
      v17 = CFSTR("NSDecimal");
    }
    else if (!strcmp(v14, "d"))
    {
      v17 = CFSTR("double");
    }
    else if (!strcmp(v14, "f"))
    {
      v17 = CFSTR("float");
    }
    else if (!strcmp(v14, "i"))
    {
      v17 = CFSTR("int");
    }
    else if (!strcmp(v14, "q"))
    {
      v17 = CFSTR("NSInteger");
    }
    else if (!strcmp(v14, "s"))
    {
      v17 = CFSTR("short");
    }
    else if (!strcmp(v14, "C"))
    {
      v17 = CFSTR("unsigned char");
    }
    else if (!strcmp(v14, "Q"))
    {
      v17 = CFSTR("NSUInteger");
    }
    else if (!strcmp(v14, "I"))
    {
      v17 = CFSTR("unsigned int");
    }
    else if (!strcmp(v14, "S"))
    {
      v17 = CFSTR("unsigned short");
    }
    else if (!strcmp(v14, "{_NSRange=QQ}"))
    {
      v17 = CFSTR("NSRange");
    }
    else
    {
      v15 = (objc_class *)objc_opt_class(v13);
      v16 = NSStringFromClass(v15);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(v16);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PrettyPropertyDescription describingPropertyNamed:withClassName:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassName:andValue:andRecursiveDepth:", v8, v17, v33, a5));

    goto LABEL_50;
  }
  v18 = objc_opt_class(NSUUID);
  if ((objc_opt_isKindOfClass(v7, v18) & 1) != 0)
  {
    v19 = objc_opt_class(NSUUID);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
LABEL_31:
    v26 = (void *)v20;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PrettyPropertyDescription describingPropertyNamed:withClassType:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassType:andValue:andRecursiveDepth:", v8, v19, v20, a5));

    goto LABEL_50;
  }
  v21 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v7, v21) & 1) != 0)
  {
    if (!dateFormatter)
    {
      v22 = objc_alloc_init((Class)NSDateFormatter);
      v23 = (void *)dateFormatter;
      dateFormatter = (uint64_t)v22;

      objc_msgSend((id)dateFormatter, "setDateStyle:", 1);
      objc_msgSend((id)dateFormatter, "setTimeStyle:", 1);
    }
    v19 = objc_opt_class(NSDate);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)dateFormatter, "stringFromDate:", v7));
    goto LABEL_31;
  }
  v24 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v7, v24) & 1) != 0)
  {
    v19 = objc_opt_class(NSURL);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    goto LABEL_31;
  }
  v25 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v7, v25) & 1) != 0)
  {
    v19 = objc_opt_class(NSData);
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld bytes"), objc_msgSend(v7, "length")));
    goto LABEL_31;
  }
  v27 = (objc_class *)objc_opt_class(v7);
  v28 = NSStringFromClass(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v7, v30) & 1) != 0
    || (v31 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v7, v31) & 1) != 0)
    || (objc_msgSend(v29, "hasPrefix:", CFSTR("NS")) & 1) == 0
    && !objc_msgSend(v29, "hasPrefix:", CFSTR("__NS")))
  {
    v11 = 0;
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PrettyPropertyDescription describingPropertyNamed:withClassName:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassName:andValue:andRecursiveDepth:", v8, v29, v32, a5));

  }
LABEL_50:

  return v11;
}

+ (id)describeArray:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeComplexObject:withName:withDepth:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15), 0, a5 + 1, (_QWORD)v20));
        objc_msgSend(v10, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v17 = +[PrettyPropertyDescription describingPropertyNamed:withClassType:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassType:andValue:andRecursiveDepth:", v9, objc_opt_class(NSArray), v10, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  return v18;
}

+ (id)describeDictionary:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v7 = a3;
  v19 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeComplexObject:withName:withDepth:", v14, 0, a5 + 1));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v16 = +[PrettyPropertyDescription describingPropertyNamed:withClassType:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassType:andValue:andRecursiveDepth:", v19, objc_opt_class(NSDictionary), v8, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

@end
