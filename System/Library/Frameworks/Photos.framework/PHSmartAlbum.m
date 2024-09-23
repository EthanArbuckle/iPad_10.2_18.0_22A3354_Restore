@implementation PHSmartAlbum

+ (id)managedEntityName
{
  return CFSTR("FetchingAlbum");
}

+ (id)albumKindFromSmartAlbumSubtype:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 201:
      result = &unk_1E3654970;
      break;
    case 202:
      result = &unk_1E36549A0;
      break;
    case 203:
      result = &unk_1E36549B8;
      break;
    case 204:
      result = &unk_1E36549E8;
      break;
    case 205:
      result = &unk_1E3654A30;
      break;
    case 206:
      result = &unk_1E3654A48;
      break;
    case 207:
      result = &unk_1E3654A78;
      break;
    case 208:
      result = &unk_1E36549D0;
      break;
    case 209:
      result = &unk_1E3654A60;
      break;
    case 210:
      result = &unk_1E3654A00;
      break;
    case 211:
      result = &unk_1E3654A18;
      break;
    case 212:
      result = &unk_1E3654A90;
      break;
    case 213:
      result = &unk_1E3654AA8;
      break;
    case 214:
      result = &unk_1E3654AC0;
      break;
    case 215:
      result = &unk_1E3654AD8;
      break;
    case 216:
      result = &unk_1E3654B08;
      break;
    case 217:
      result = &unk_1E3654B68;
      break;
    case 218:
      result = &unk_1E3654B80;
      break;
    case 219:
      result = &unk_1E3654988;
      break;
    default:
      result = 0;
      switch(a3)
      {
        case 1000000201:
          result = &unk_1E3654BE0;
          break;
        case 1000000203:
          result = &unk_1E3654BF8;
          break;
        case 1000000204:
          result = &unk_1E3654AF0;
          break;
        case 1000000205:
          result = &unk_1E3654BC8;
          break;
        case 1000000206:
          result = &unk_1E3654B20;
          break;
        case 1000000207:
          result = &unk_1E3654B38;
          break;
        case 1000000211:
          result = &unk_1E3654BB0;
          break;
        case 1000000212:
          result = &unk_1E3654C10;
          break;
        case 1000000214:
          result = &unk_1E3654B50;
          break;
        case 1000000215:
          result = &unk_1E3654B98;
          break;
        case 1000000218:
          result = &unk_1E3654C28;
          break;
        case 1000000219:
          result = &unk_1E3654C40;
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

+ (id)_collectionSubtypeExpressionForFetchRequests
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("kind"));
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHSmartAlbum");
  return CFSTR("PHSmartAlbum");
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  objc_super v29;

  v6 = a3;
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___PHSmartAlbum;
  objc_msgSendSuper2(&v29, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "leftExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightExpression");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "expressionType");
    if (v10 == 3)
      v11 = v8;
    else
      v11 = v9;
    objc_msgSend(v11, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("assetCollectionSubtype")))
    {
      if (v10 == 3)
        v13 = v9;
      else
        v13 = v8;
      objc_msgSend(v13, "constantValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_collectionSubtypeExpressionForFetchRequests");
      v27 = objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __62__PHSmartAlbum_fetchPredicateFromComparisonPredicate_options___block_invoke;
      v28[3] = &__block_descriptor_40_e8__16__0_8l;
      v28[4] = a1;
      v26 = v14;
      PHQueryTransformExpressionConstantValue(v14, v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0CB3518]);
      v18 = objc_msgSend(v6, "comparisonPredicateModifier");
      v19 = objc_msgSend(v6, "predicateOperatorType");
      v20 = objc_msgSend(v6, "options");
      v21 = v17;
      if (v10 == 3)
      {
        v22 = (void *)v27;
        v23 = (void *)v27;
        v24 = v16;
      }
      else
      {
        v23 = v16;
        v22 = (void *)v27;
        v24 = (void *)v27;
      }
      v7 = (void *)objc_msgSend(v21, "initWithLeftExpression:rightExpression:modifier:type:options:", v23, v24, v18, v19, v20);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

uint64_t __62__PHSmartAlbum_fetchPredicateFromComparisonPredicate_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "albumKindFromSmartAlbumSubtype:", objc_msgSend(a2, "integerValue"));
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

@end
