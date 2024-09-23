@implementation MKAppleMediaServices

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MKAppleMediaServices_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE2D860 != -1)
    dispatch_once(&qword_1ECE2D860, block);
  return (id)_MergedGlobals_126;
}

void __38__MKAppleMediaServices_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_126;
  _MergedGlobals_126 = (uint64_t)v1;

}

- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 source:(int64_t)a4 completion:(id)a5
{
  -[MKAppleMediaServices appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:](self, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", a3, 1, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0);
}

- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 artworkSize:(CGSize)a4 screenScale:(double)a5 type:(int64_t)a6 source:(int64_t)a7 completion:(id)a8
{
  -[MKAppleMediaServices appleMediaServicesResultsWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:](self, "appleMediaServicesResultsWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:", a3, 0, a6, a7, a8, a4.width, a4.height, a5);
}

- (void)appleMediaServicesResultsWithBundleIdentifiers:(id)a3 source:(int64_t)a4 completion:(id)a5
{
  -[MKAppleMediaServices appleMediaServicesResultsWithBundleIdentifiers:artworkSize:screenScale:source:completion:](self, "appleMediaServicesResultsWithBundleIdentifiers:artworkSize:screenScale:source:completion:", a3, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 0.0);
}

- (void)appleMediaServicesResultsWithBundleIdentifiers:(id)a3 artworkSize:(CGSize)a4 screenScale:(double)a5 source:(int64_t)a6 completion:(id)a7
{
  -[MKAppleMediaServices appleMediaServicesResultsWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:](self, "appleMediaServicesResultsWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:", 0, a3, 1, a6, a7, a4.width, a4.height, a5);
}

- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 bundleIdentifiers:(id)a4 artworkSize:(CGSize)a5 screenScale:(double)a6 type:(int64_t)a7 source:(int64_t)a8 completion:(id)a9
{
  double height;
  double width;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  height = a5.height;
  width = a5.width;
  v17 = a9;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __130__MKAppleMediaServices_appleMediaServicesResultsWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke;
  v19[3] = &unk_1E20D8000;
  v20 = v17;
  v18 = v17;
  -[MKAppleMediaServices mediaResultWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:](self, "mediaResultWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:", a3, a4, a7, a8, v19, width, height, a6);

}

void __130__MKAppleMediaServices_appleMediaServicesResultsWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("error");
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MKAppleMediaServicesErrorDomain"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v11);

  }
  else
  {
    v12 = objc_msgSend(v5, "count");
    v13 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v5, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MKAppleMediaServicesErrorDomain"), 2, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
  }

}

- (void)mediaResultWithIdentifiers:(id)a3 bundleIdentifiers:(id)a4 artworkSize:(CGSize)a5 screenScale:(double)a6 type:(int64_t)a7 source:(int64_t)a8 completion:(id)a9
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  int64_t v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  _QWORD block[4];
  void *v49;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  height = a5.height;
  width = a5.width;
  v17 = a3;
  v18 = a4;
  v19 = a9;
  objc_msgSend(getAMSMediaTaskClass(), "bagSubProfile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAMSMediaTaskClass(), "bagSubProfileVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v22 = (void *)getAMSBagClass_softClass;
  v54 = getAMSBagClass_softClass;
  if (!getAMSBagClass_softClass)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __getAMSBagClass_block_invoke;
    v50[3] = &unk_1E20D8078;
    v50[4] = &v51;
    __getAMSBagClass_block_invoke((uint64_t)v50);
    v22 = (void *)v52[3];
  }
  v40 = v19;
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v51, 8);
  objc_msgSend(v23, "bagForProfile:profileVersion:", v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc((Class)getAMSMediaTaskClass()), "initWithType:clientIdentifier:clientVersion:bag:", -[MKAppleMediaServices AMSMediaTaskTypeFromGEOAppleMediaServicesMediaType:](self, "AMSMediaTaskTypeFromGEOAppleMediaServicesMediaType:", a7), CFSTR("com.apple.Maps"), CFSTR("1"), v24);
  if (objc_msgSend(v17, "count"))
  {
    v36 = v21;
    v37 = v20;
    v38 = v18;
    v39 = v17;
    objc_msgSend(v25, "setItemIdentifiers:", v17);
  }
  else
  {
    if (!objc_msgSend(v18, "count"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke;
      block[3] = &unk_1E20D7EF8;
      v49 = v40;
      v35 = v40;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v34 = v49;
      goto LABEL_8;
    }
    v36 = v21;
    v37 = v20;
    v38 = v18;
    v39 = v17;
    objc_msgSend(v25, "setBundleIdentifiers:", v18);
  }
  -[MKAppleMediaServices additionalParameterWithType:](self, "additionalParameterWithType:", a7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAdditionalQueryParams:", v26);

  objc_msgSend(MEMORY[0x1E0D27408], "sharedCounter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAppleMediaServices externalRequestCounterRequestType](self, "externalRequestCounterRequestType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAppleMediaServices externalRequestCounterRequestSubtypeWithType:](self, "externalRequestCounterRequestSubtypeWithType:", a7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sourceStringWithSource:", a8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  GEOApplicationIdentifierOrProcessName();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "externalRequestCounterTicketForType:subtype:source:appId:", v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "perform");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_2;
  v41[3] = &unk_1E20D8050;
  v45 = width;
  v46 = height;
  v47 = a6;
  v42 = v32;
  v43 = v40;
  v44 = a7;
  v34 = v40;
  v35 = v32;
  objc_msgSend(v33, "addFinishBlock:", v41);

  v18 = v38;
  v17 = v39;
  v21 = v36;
  v20 = v37;
LABEL_8:

}

uint64_t __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v21 = a3;
  v22 = v5;
  objc_msgSend(v5, "responseDataItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D26EF0]), "initWithResponseDictionary:mediaType:artworkSize:screenScale:", v13, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
        if (v14)
        {
          MKGetAppleMediaServicesServerLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v32 = v14;
            v33 = 2112;
            v34 = v13;
            _os_log_impl(&dword_18B0B0000, v15, OS_LOG_TYPE_INFO, "Returning result %@ from responseDictionary %@", buf, 0x16u);
          }

          objc_msgSend(v7, "addObject:", v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v10);
  }

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v22, "responseDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "requestCompletedWithAMPResult:", v17);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_13;
  block[3] = &unk_1E20D8028;
  v18 = *(id *)(a1 + 40);
  v24 = v7;
  v25 = v21;
  v26 = v18;
  v19 = v21;
  v20 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));
}

- (int64_t)AMSMediaTaskTypeFromGEOAppleMediaServicesMediaType:(int64_t)a3
{
  int64_t result;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  result = 0;
  v8 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
      MKGetAppleMediaServicesServerLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_ERROR, "Unhandled GEOAppleMediaServicesMediaType %@", (uint8_t *)&v6, 0xCu);

      }
      goto LABEL_5;
    case 3:
      result = 5;
      break;
    case 4:
      result = 203;
      break;
    case 5:
LABEL_5:
      result = 200;
      break;
    case 6:
      result = 205;
      break;
    case 7:
      result = 202;
      break;
    case 8:
      result = 204;
      break;
    case 9:
      result = 201;
      break;
    case 10:
      result = 206;
      break;
    case 11:
      result = 207;
      break;
    case 12:
      result = 301;
      break;
    case 13:
      result = 300;
      break;
    case 14:
      result = 302;
      break;
    case 15:
      result = 101;
      break;
    case 16:
      result = 100;
      break;
    case 17:
      result = 103;
      break;
    case 18:
      result = 400;
      break;
    case 19:
      result = 402;
      break;
    case 20:
      result = 401;
      break;
    default:
      return result;
  }
  return result;
}

- (id)additionalParameterWithType:(int64_t)a3
{
  if (a3 <= 2)
  {
    if (a3 == 1)
      return &unk_1E2159C40;
    if (a3 == 2)
      return &unk_1E2159CB8;
    else
      return 0;
  }
  else
  {
    switch(a3)
    {
      case 19:
        return &unk_1E2159C90;
      case 17:
        return &unk_1E2159C68;
      case 3:
        return &unk_1E2159C40;
      default:
        return 0;
    }
  }
}

+ (id)sourceStringWithSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9)
    return CFSTR("Open App");
  else
    return *(&off_1E20D80B0 + a3 - 2);
}

- (id)externalRequestCounterRequestType
{
  return CFSTR("AppleMediaServices");
}

- (id)externalRequestCounterRequestSubtypeWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13)
    return CFSTR("Unknown Subtype");
  else
    return *(&off_1E20D8100 + a3 - 1);
}

@end
