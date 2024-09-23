@implementation NTKPhotosColorEditOption

+ (id)pigmentFaceDomain
{
  return CFSTR("photos");
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_996);
  WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_997);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_997);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_997, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_998 = objc_msgSend(v4, "version");

    objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_orderedValuesForDevice____colors_995;
    _orderedValuesForDevice____colors_995 = v11;

    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = _orderedValuesForDevice____previousCLKDeviceVersion_998;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_996);
  v13 = (id)_orderedValuesForDevice____colors_995;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___NTKPhotosColorEditOption;
  objc_msgSendSuper2(&v13, sel___orderedValuesForDevice_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___NTKPhotosColorEditOption;
  objc_msgSendSuper2(&v12, sel__thirdPartyValues);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInArray:", v7);

  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1050, 0);
  v8 = objc_msgSend(v5, "count");
  while ((int)v8 >= 1)
  {
    objc_msgSend(v5, "objectAtIndex:", --v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", &unk_1E6CA0C60);

    if (v10)
      goto LABEL_6;
  }
  v8 = 0;
LABEL_6:
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1068, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1080, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1098, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA10B0, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA10C8, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA10E0, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA10F8, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1110, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1128, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1140, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1158, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1170, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1188, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA11A0, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA11B8, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA11D0, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA11E8, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1200, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1218, v8);
  objc_msgSend(v5, "insertObject:atIndex:", &unk_1E6CA1230, v8);

  return v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6;
  unint64_t v7;
  __CFString *v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3 - 3000;
  v8 = CFSTR("dual-tone-01");
  switch(v7)
  {
    case 0uLL:
      objc_msgSend(a1, "originalColorName");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 1uLL:
      break;
    case 2uLL:
      v8 = CFSTR("dual-tone-02");
      break;
    case 3uLL:
      v8 = CFSTR("dual-tone-03");
      break;
    case 4uLL:
      v8 = CFSTR("dual-tone-04");
      break;
    case 5uLL:
      v8 = CFSTR("dual-tone-05");
      break;
    case 6uLL:
      v8 = CFSTR("dual-tone-06");
      break;
    case 7uLL:
      v8 = CFSTR("dual-tone-07");
      break;
    case 8uLL:
      v8 = CFSTR("dual-tone-08");
      break;
    case 9uLL:
      v8 = CFSTR("dual-tone-09");
      break;
    case 0xAuLL:
      v8 = CFSTR("dual-tone-10");
      break;
    case 0xBuLL:
      v8 = CFSTR("dual-tone-11");
      break;
    case 0xCuLL:
      v8 = CFSTR("dual-tone-12");
      break;
    case 0xDuLL:
      v8 = CFSTR("dual-tone-13");
      break;
    case 0xEuLL:
      v8 = CFSTR("dual-tone-14");
      break;
    case 0xFuLL:
      v8 = CFSTR("dual-tone-15");
      break;
    case 0x10uLL:
      v8 = CFSTR("dual-tone-16");
      break;
    case 0x11uLL:
      v8 = CFSTR("dual-tone-17");
      break;
    case 0x12uLL:
      v8 = CFSTR("dual-tone-18");
      break;
    case 0x13uLL:
      v8 = CFSTR("dual-tone-19");
      break;
    case 0x14uLL:
      v8 = CFSTR("dual-tone-20");
      break;
    default:
      +[NTKFaceColorEditOption _snapshotKeyForValue:forDevice:](NTKFaceColorEditOption, "_snapshotKeyForValue:forDevice:", CFSTR("dual-tone-01"), v6);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v8 = (__CFString *)v9;
      break;
  }

  return v8;
}

- (id)_valueToFaceBundleStringDict
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__NTKPhotosColorEditOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_1063 != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1063, block);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1062;
}

void __56__NTKPhotosColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v25.receiver = *(id *)(a1 + 32);
  v25.super_class = (Class)NTKPhotosColorEditOption;
  objc_msgSendSuper2(&v25, sel__valueToFaceBundleStringDict);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v66 = &unk_1E6CA1050;
  v67[0] = CFSTR("none");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v64 = &unk_1E6CA1230;
  v65 = CFSTR("dual tone 1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  v62 = &unk_1E6CA1218;
  v63 = CFSTR("dual tone 2");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v5);

  v60 = &unk_1E6CA1200;
  v61 = CFSTR("dual tone 3");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v6);

  v58 = &unk_1E6CA11E8;
  v59 = CFSTR("dual tone 4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v7);

  v56 = &unk_1E6CA11D0;
  v57 = CFSTR("dual tone 5");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v8);

  v54 = &unk_1E6CA11B8;
  v55 = CFSTR("dual tone 6");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v9);

  v52 = &unk_1E6CA11A0;
  v53 = CFSTR("dual tone 7");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v10);

  v50 = &unk_1E6CA1188;
  v51 = CFSTR("dual tone 8");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v11);

  v48 = &unk_1E6CA1170;
  v49 = CFSTR("dual tone 9");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v12);

  v46 = &unk_1E6CA1158;
  v47 = CFSTR("dual tone 10");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v13);

  v44 = &unk_1E6CA1140;
  v45 = CFSTR("dual tone 11");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v14);

  v42 = &unk_1E6CA1128;
  v43 = CFSTR("dual tone 12");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v15);

  v40 = &unk_1E6CA1110;
  v41 = CFSTR("dual tone 13");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v16);

  v38 = &unk_1E6CA10F8;
  v39 = CFSTR("dual tone 14");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v17);

  v36 = &unk_1E6CA10E0;
  v37 = CFSTR("dual tone 15");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v18);

  v34 = &unk_1E6CA10C8;
  v35 = CFSTR("dual tone 16");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v19);

  v32 = &unk_1E6CA10B0;
  v33 = CFSTR("dual tone 17");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v20);

  v30 = &unk_1E6CA1098;
  v31 = CFSTR("dual tone 18");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v21);

  v28 = &unk_1E6CA1080;
  v29 = CFSTR("dual tone 19");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v22);

  v26 = &unk_1E6CA1068;
  v27 = CFSTR("dual tone 20");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v23);

  v24 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1062;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1062 = (uint64_t)v2;

}

- (id)pigmentEditOption
{
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NTKPigmentEditOption *v9;
  NTKPigmentEditOption *v10;
  objc_super v12;

  v3 = CFSTR("photos");
  if (-[NTKPhotosColorEditOption color](self, "color") == 3000)
  {
    +[NTKPhotosColorEditOption originalColorName](NTKPhotosColorEditOption, "originalColorName");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[NTKPhotosColorEditOption color](self, "color") < 0xBB9)
    {
LABEL_6:
      v7 = 0;
LABEL_33:
      v12.receiver = self;
      v12.super_class = (Class)NTKPhotosColorEditOption;
      -[NTKFaceColorEditOption pigmentEditOption](&v12, sel_pigmentEditOption);
      v9 = (NTKPigmentEditOption *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    switch(-[NTKPhotosColorEditOption color](self, "color"))
    {
      case 3001uLL:
        v5 = 45;
        v6 = 12;
        break;
      case 3002uLL:
        v5 = 61;
        v6 = 65;
        break;
      case 3003uLL:
        v5 = 65;
        v6 = 64;
        break;
      case 3004uLL:
        v5 = 61;
        v6 = 62;
        break;
      case 3005uLL:
        v5 = 4;
        v6 = 9;
        break;
      case 3006uLL:
        v5 = 39;
        v6 = 25;
        break;
      case 3007uLL:
        v5 = 8;
        v6 = 47;
        break;
      case 3008uLL:
        v5 = 35;
        v6 = 0;
        break;
      case 3009uLL:
        v5 = 72;
        goto LABEL_17;
      case 3010uLL:
        v5 = 3;
        v6 = 70;
        break;
      case 3011uLL:
        v5 = 8;
LABEL_17:
        v6 = 73;
        break;
      case 3012uLL:
        v5 = 5;
        v6 = 69;
        break;
      case 3013uLL:
        v5 = 78;
        v6 = 79;
        break;
      case 3014uLL:
        v5 = 76;
        v6 = 75;
        break;
      case 3015uLL:
        v5 = 74;
        v6 = 78;
        break;
      case 3016uLL:
        v5 = 0;
        v6 = 87;
        break;
      case 3017uLL:
        v5 = 82;
        v6 = 85;
        break;
      case 3018uLL:
        v5 = 87;
        v6 = 86;
        break;
      case 3019uLL:
        v5 = 49;
        v6 = 81;
        break;
      case 3020uLL:
        v5 = 87;
        v6 = 71;
        break;
      default:
        goto LABEL_6;
    }
    NTKFaceColorNameForDuotones(v5, v6);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v4;
  if (v4)
    v8 = v3 == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_33;
  v9 = -[NTKPigmentEditOption initWithOptionName:collectionName:]([NTKPigmentEditOption alloc], "initWithOptionName:collectionName:", v4, v3);
LABEL_34:
  v10 = v9;

  return v10;
}

+ (id)originalColorName
{
  return CFSTR("original");
}

@end
