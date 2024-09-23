uint64_t NSStringToHMSymptomType(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;
  void *v5;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeediCloudCredential")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeediTunesCredential")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedHomeKitFix")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedWiFiFix")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedWiFiPerformanceFix")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedInternetFix")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedHardwareFix")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeStereoVersionMismatch")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeStereoNotFound")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeStereoError")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeWiFiNetworkMismatch")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeFixInProgress")) & 1) != 0)
  {
    v2 = 1000;
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedGeneralFix")) & 1) == 0)
    {
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNoConfiguredTargets")) & 1) != 0)
      {
        v2 = 12;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeVPNProfileExpired")) & 1) != 0)
      {
        v2 = 13;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeed8021xNetworkFix")) & 1) != 0)
      {
        v2 = 14;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedWiFiSecurityFix")) & 1) != 0)
      {
        v2 = 15;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedNetworkProfileFix")) & 1) != 0)
      {
        v2 = 16;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedNetworkProfileInstall")) & 1) != 0)
      {
        v2 = 17;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNetworkNotShareable")) & 1) != 0)
      {
        v2 = 18;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedCaptiveLeaseRenewal")) & 1) != 0)
      {
        v2 = 19;
        goto LABEL_45;
      }
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HMSymptomTypeNeedCDPFix")) & 1) != 0)
      {
        v2 = 20;
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "HMSymptomType NSStringToHMSymptomType(NSString *__strong _Nonnull)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HMSymptomsHandler+HFAdditions.m"), 153, CFSTR("Unsupported Symptom: %@"), v1);

    }
    v2 = 999;
  }
LABEL_45:

  return v2;
}

void sub_1DD4C7AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4C8D84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD4CD074(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD4CD360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD4CF574(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromHFControlItemCharacteristicUsage(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1EA72DEC0[a1];
}

void sub_1DD4D0730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4D49D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4D62A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD4D8598(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD4DE384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD4E0158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4E0500(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD4E05E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E09B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4E0AA8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E0F8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD4E1074(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E14CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD4E15B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E1994(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD4E1A64(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E1F9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD4E206C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E2268(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD4E2778(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD4E2848(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E2A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4E2B7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E2E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4E30A8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD4E3484(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD4E3554(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E377C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD4E384C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4E47A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;

  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1DD4E4930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;

  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1DD4E602C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4E6E3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1DD4EBA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4EBD3C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD4EFBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4F4B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4F58E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4FA1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4FBFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4FC348(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id HFPrunePropertyList(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  id v4;

  v1 = a1;
  if ((objc_msgSend(v1, "conformsToProtocol:", &unk_1F0446210) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
      if (objc_msgSend(v2, "count"))
      {
        objc_msgSend(v2, "na_dictionaryByMappingValues:", &__block_literal_global_73);
        v3 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v4 = (id)v3;
LABEL_12:

        goto LABEL_16;
      }
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
      if (objc_msgSend(v2, "count"))
      {
        objc_msgSend(v2, "na_map:", &__block_literal_global_55);
        v3 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v1, "length"))
    {
      v4 = v1;
      goto LABEL_16;
    }
  }
  else
  {
    NSLog(CFSTR("Found object in property list that is not property-list compatible! Object: %@"), v1);
  }
  v4 = 0;
LABEL_16:

  return v4;
}

void sub_1DD4FCCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4FF23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD4FF66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1DD4FFFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD50192C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DD504B88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1DD507444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 112));
  _Unwind_Resume(a1);
}

void sub_1DD5080A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD508B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD508D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD508F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5090C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHMCameraStreamingOption(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1EA7319F8[a1];
}

uint64_t cameraStreamingOptionFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HFCameraStreamingOptionOff")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HFCameraStreamingOptionStreamAndRecord")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("HFCameraStreamingOptionDetectActivity")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("HFCameraStreamingOptionStream"));
  }

  return v2;
}

const __CFString *NSStringFromHMCameraMotionDetectionType(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1 - 1;
  result = 0;
  switch(v1)
  {
    case 0:
      result = CFSTR("HFCameraRecordingEventAnyMotion");
      break;
    case 1:
      result = CFSTR("HFCameraRecordingEventPeople");
      break;
    case 2:
    case 4:
    case 5:
    case 6:
      return result;
    case 3:
      result = CFSTR("HFCameraRecordingEventAnimals");
      break;
    case 7:
      result = CFSTR("HFCameraRecordingEventVehicles");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

__CFString *NSStringFromHMCameraSignificantEventPersonFamiliarityOptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return off_1EA7319D8[a1 - 1];
}

id HFLocalizedStringFromHMCameraAccessMode(unint64_t a1)
{
  __CFString *v1;

  if (a1 > 3)
    v1 = 0;
  else
    v1 = off_1EA7319F8[a1];
  return _HFLocalizedStringWithDefaultValue(v1, v1, 1);
}

id HFLocalizedStringFromHMCameraMotionDetectionType(uint64_t a1)
{
  void *v1;
  void *v2;

  HFLocalizationKeyFromHMCameraMotionDetectionType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(v1, v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

const __CFString *HFLocalizationKeyFromHMCameraMotionDetectionType(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;

  v1 = a1 - 1;
  result = 0;
  switch(v1)
  {
    case 0:
      result = CFSTR("HFCameraRecordingEventAnyMotion");
      break;
    case 1:
      result = CFSTR("HFCameraRecordingEventPeople");
      break;
    case 2:
    case 4:
    case 5:
    case 6:
      return result;
    case 3:
      result = CFSTR("HFCameraRecordingEventAnimals");
      break;
    case 7:
      result = CFSTR("HFCameraRecordingEventVehicles");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

id HFLocalizedStringFromHMCameraSignificantEventPersonFamiliarityOptions(uint64_t a1)
{
  __CFString *v1;

  if ((unint64_t)(a1 - 1) > 3)
    v1 = 0;
  else
    v1 = off_1EA7319D8[a1 - 1];
  return _HFLocalizedStringWithDefaultValue(v1, v1, 1);
}

__CFString *HFLocalizationKeyFromHMCameraSignificantEventPersonFamiliarityOptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return off_1EA7319D8[a1 - 1];
}

void sub_1DD50A968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD50AFA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD50B0C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD50D520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSLocalizedStringFromHFMediaAccessControlClassification(uint64_t a1, int a2)
{
  __CFString *v2;
  __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 0:
      v2 = CFSTR("HFMediaAccessControlClassificationEveryone");
      if (a2)
        goto LABEL_9;
      goto LABEL_10;
    case 1:
      v2 = CFSTR("HFMediaAccessControlClassificationAnyoneOnTheSameNetwork");
      if (!a2)
        goto LABEL_10;
      goto LABEL_9;
    case 2:
      v2 = CFSTR("HFMediaAccessControlClassificationOnlyPeopleSharingThisHome");
      if (a2)
        goto LABEL_9;
      goto LABEL_10;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull NSLocalizedStringFromHFMediaAccessControlClassification(HFMediaAccessControlClassification, BOOL)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HFMediaAccessControlDescriptor.m"), 24, CFSTR("Well. This is unexpected.  How did you get here?"));

      v3 = &stru_1EA741FF8;
      goto LABEL_12;
    default:
      v2 = 0;
      if (!a2)
        goto LABEL_10;
LABEL_9:
      -[__CFString stringByAppendingFormat:](v2, "stringByAppendingFormat:", CFSTR("_Short"));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      _HFLocalizedStringWithDefaultValue(v2, v2, 1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      return v3;
  }
}

void sub_1DD511F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD514D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD514F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HFPrimaryStateForDoorState(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return qword_1DD6697B0[a1];
}

uint64_t HFPrimaryStateForLockMechanismState(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return qword_1DD6697D8[a1];
}

uint64_t HFPrimaryStateForCurrentSecuritySystemState(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return qword_1DD6697F8[a1];
}

uint64_t HFLockMechanismStateForPrimaryState(uint64_t a1)
{
  if (a1)
    return a1 == 1;
  else
    return 3;
}

BOOL HFDoorStateForPrimaryState(unint64_t a1)
{
  return a1 < 2;
}

uint64_t HFPrimaryStateForTargetSecuritySystemState(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return qword_1DD669820[a1];
}

uint64_t HFTargetSecuritySystemStateForPrimaryState(unint64_t a1)
{
  if (a1 > 1)
    return 1;
  else
    return 3;
}

void sub_1DD51A62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD51CD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_1DD51CFC8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD51E558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromHFDiffOperationType(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown operation type)");
  else
    return off_1EA732F30[a1];
}

void sub_1DD52668C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD527158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_1DD528208(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1DD52E9C0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1DD52F7A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD531A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id _HomeKitSettingToHFItem_CacheItemCacheKey(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v1 = a1;
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "keyPath");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Group-%@"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v8 = v2;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v6 = v9;

    if (v6)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "keyPath");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Setting-%@"), v11);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      v12 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v11 = v13;

      if (v11)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "keyPath");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("SettingGroupEntity-%@"), v15);
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        v15 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v7 = v16;

        if (v7)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("SelectionItem-%@-%@"), v18, v19);
          v7 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v15 = 0;
        }
      }

    }
  }

  return v7;
}

void sub_1DD5341A8(_Unwind_Exception *a1)
{
  uint64_t v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  if (v1)
    objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD537AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD53AC44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD53BEC4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD542540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD54399C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  if (a14)
    (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Unwind_Resume(a1);
}

void sub_1DD544018(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t HFAppProxiesContainsAppProxyWithIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HFAppProxiesContainsAppProxyWithIdentifier_block_invoke;
  v7[3] = &unk_1EA735318;
  v8 = v3;
  v4 = v3;
  v5 = objc_msgSend(a1, "na_any:", v7);

  return v5;
}

void sub_1DD544754(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD54620C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD548938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD548A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD548C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD54AF8C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD54BDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD54CE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD54CF40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD54D61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD54D740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD54E038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HFAppDataSetValueIfChanged(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a1;
  v5 = a2;
  v6 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 != v6 && (objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t _handleStateDumpRequest(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x40uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138413314;
    v13 = a1;
    v14 = 2112;
    v15 = a2;
    v16 = 2112;
    v17 = a3;
    v18 = 2112;
    v19 = a4;
    v20 = 2112;
    v21 = a5;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "_handleStateDumpRequest called with CFNotificationCenter: %@, observer: %@, name: %@, object: %@, userInfo: %@", (uint8_t *)&v12, 0x34u);
  }

  return objc_msgSend(a2, "_writeStateDump");
}

void _HFLogStateDumpNode(void *a1, void *a2, const __CFString *a3)
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(void *, const __CFString *, _QWORD *, const __CFString *);
  id *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (a3)
    v8 = a3;
  else
    v8 = &stru_1EA741FF8;
  objc_msgSend(v6, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___HFLogStateDumpNode_block_invoke;
  aBlock[3] = &unk_1EA736060;
  v11 = v9;
  v25 = v11;
  v12 = v7;
  v26 = v12;
  v13 = (void (**)(void *, const __CFString *, _QWORD *, const __CFString *))_Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = ___HFLogStateDumpNode_block_invoke_73;
    v22[3] = &unk_1EA730040;
    v14 = &v23;
    v23 = v5;
    v13[2](v13, CFSTR("["), v22, CFSTR("]"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = ___HFLogStateDumpNode_block_invoke_2;
      v20[3] = &unk_1EA730040;
      v14 = &v21;
      v21 = v5;
      v13[2](v13, CFSTR("{"), v20, CFSTR("}"));
    }
    else
    {
      objc_msgSend(v5, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = ___HFLogStateDumpNode_block_invoke_4;
      v17[3] = &unk_1EA727050;
      v14 = &v18;
      v18 = v11;
      v19 = v12;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);

    }
  }

}

void sub_1DD556E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  if (a16)
    (*(void (**)(void))(a16 + 16))();
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1DD5584A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DD559738(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DD55A934(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD55B4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD55B604(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD55BCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1DD5631D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_1DD563B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD564488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD564B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD565FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD566130(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5668C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD566BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1DD566CF4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5678A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5682FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD568740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD568A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD568F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5698D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD56C6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD56C98C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD56CCF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD56CDE4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD56CFBC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD56D21C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD56D4E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD56D66C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD56D934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD56F548(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD574DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5757B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD575FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD576104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD576744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5768A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD576AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD576D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__42(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__43(uint64_t a1)
{

}

void sub_1DD5772CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD578EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,id a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_1DD57A51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HFHomeKitObjectUniqueIdentifiers(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  if (a1)
  {
    objc_msgSend(a1, "na_map:", &__block_literal_global_138);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void sub_1DD57E360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD57ED68(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD585750(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD5858A0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD585AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD585C1C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD587064(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD58A954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HFOptionalLocalizedString(void *a1)
{
  return _HFLocalizedStringWithDefaultValue(a1, 0, 0);
}

id HFLocalizedStringWithDefaultValue(void *a1, void *a2)
{
  return _HFLocalizedStringWithDefaultValue(a1, a2, 0);
}

id HFLocalizedStringWithFormatterBlock(void *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  _HFLocalizedStringWithDefaultValue(a1, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && (objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
  {
    v6[2](v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

id HFLocalizedWiFiString(void *a1)
{
  void *v1;
  void *v2;

  HFLocalizedWiFiStringKeyForKey(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(v1, v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HFLocalizedWiFiStringKeyForKey(void *a1)
{
  id v1;
  _BOOL4 v2;
  const __CFString *v3;
  void *v4;

  v1 = a1;
  v2 = +[HFUtilities useWLANInsteadOfWiFi](HFUtilities, "useWLANInsteadOfWiFi");
  v3 = CFSTR("WIFI");
  if (v2)
    v3 = CFSTR("WLAN");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HFLocalizedCategoryOrPrimaryServiceTypeString(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CBA1A8];
  v5 = a1;
  objc_msgSend(v4, "hf_getUserFriendlyDescriptionKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_getUserFriendlyDescriptionKey:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x1E0CB7A70]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@"), v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _HFLocalizedStringWithDefaultValue(v13, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(v10, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

const __CFString *HFHomeControlCenterModuleBundleID()
{
  return CFSTR("com.apple.Home.ControlCenter");
}

const __CFString *HFHomeKitDaemonFrameworkPath()
{
  return CFSTR("/System/Library/PrivateFrameworks/HomeKitDaemon.framework");
}

void sub_1DD58F480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD58F59C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1DD590600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DD590CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5948F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5963F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD59760C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HFPreferencesBoolForKeyWithinDomain(void *a1, void *a2)
{
  return HFPreferencesBooleanValueForKeyWithinDomain(a1, a2) == 2;
}

uint64_t HomeKitPreferencesBooleanValueForKey(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = _InstallHomeKitPreferencesObserverIfNecessary_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_InstallHomeKitPreferencesObserverIfNecessary_onceToken, &__block_literal_global_227_0);
  v3 = HFPreferencesBooleanValueForKeyWithinDomain(v2, CFSTR("com.apple.homed"));

  return v3;
}

id HFPreferencesNumberForKey(void *a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  if (v1)
  {
    if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1)
      dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_225);
    objc_opt_class();
    v2 = (id)CFPreferencesCopyAppValue(v1, CFSTR("com.apple.Home"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id HFPreferencesStringForKey(void *a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  if (v1)
  {
    if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1)
      dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_225);
    objc_opt_class();
    v2 = (id)CFPreferencesCopyAppValue(v1, CFSTR("com.apple.Home"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id HomeKitPreferencesStringForKey(void *a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  if (v1)
  {
    if (_InstallHomeKitPreferencesObserverIfNecessary_onceToken != -1)
      dispatch_once(&_InstallHomeKitPreferencesObserverIfNecessary_onceToken, &__block_literal_global_227_0);
    objc_opt_class();
    v2 = (id)CFPreferencesCopyAppValue(v1, CFSTR("com.apple.homed"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void HFPreferencesRemoveValueForKey(void *a1)
{
  __CFString *v1;
  const __CFString *key;

  v1 = a1;
  if (v1)
  {
    key = v1;
    if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1)
      dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_225);
    CFPreferencesSetAppValue(key, 0, CFSTR("com.apple.Home"));
    v1 = (__CFString *)key;
  }

}

BOOL HomeKitPreferencesBoolForKey(void *a1)
{
  return HomeKitPreferencesBooleanValueForKey(a1) == 2;
}

BOOL HFPreferencesBoolForKey(void *a1)
{
  return HFPreferencesBooleanValueForKey(a1) == 2;
}

id HFForceCameraQRCodeURLString()
{
  return HFPreferencesStringForKey(CFSTR("HFForceCameraQRCodeURLString"));
}

id HFForceCameraLegacyCodeURLString()
{
  return HFPreferencesStringForKey(CFSTR("HFForceCameraLegacyCodeURLString"));
}

id HFForceNFCURLString()
{
  return HFPreferencesStringForKey(CFSTR("HFForceNFCURLString"));
}

BOOL HFForceMigrationOnboarding()
{
  return HFPreferencesBooleanValueForKey(CFSTR("HFForceMigrationOnboardingKey")) == 2;
}

BOOL HFForceSwitchHomeWelcomeOnboarding()
{
  return HFPreferencesBooleanValueForKey(CFSTR("HFForceSwitchHomeWelcomeOnboardingKey")) == 2;
}

BOOL HFForceDoorbellRecognitionOnboarding()
{
  return HFPreferencesBooleanValueForKey(CFSTR("HFForceDoorbellRecognitionOnboardingKey")) == 2;
}

BOOL HFForceOwnerMustUpgradeOnboarding()
{
  return HFPreferencesBooleanValueForKey(CFSTR("HFForceOwnerMustUpgradeOnboardingKey")) == 2;
}

BOOL HFCheckAndClearResetAnnounceTextButtonViewCountPreference()
{
  uint64_t v0;

  v0 = HFPreferencesBooleanValueForKey(CFSTR("HFResetAnounceTextButtonDisplayStatsKey"));
  if (v0 == 2)
    HFPreferencesRemoveValueForKey(CFSTR("HFResetAnounceTextButtonDisplayStatsKey"));
  return v0 == 2;
}

BOOL HFCheckAndClearResetUtilityPreference()
{
  uint64_t v0;

  v0 = HFPreferencesBooleanValueForKey(CFSTR("HFResetUtilityOnboarding"));
  if (v0 == 2)
    HFPreferencesRemoveValueForKey(CFSTR("HFResetUtilityOnboarding"));
  return v0 == 2;
}

BOOL HFForceUtilityOnboarding()
{
  return HFPreferencesBooleanValueForKey(CFSTR("forceUtilityOnboarding")) == 2;
}

BOOL HKForceDevicesNeedUpgrade()
{
  return HFPreferencesBooleanValueForKey(CFSTR("forceDevicesNeedUpgradeKey")) == 2;
}

uint64_t HFHideQuickControls()
{
  id v0;
  uint64_t v1;

  if (qword_1ED3798F0 != -1)
    dispatch_once(&qword_1ED3798F0, &__block_literal_global_210_0);
  v0 = (id)qword_1ED3798F8;
  v1 = objc_msgSend(v0, "BOOLValue");

  return v1;
}

BOOL HFForceAccessoryFirmwareUpdateOnboarding()
{
  return HFPreferencesBooleanValueForKey(CFSTR("forceAccessoryFirmwareUpdateOnboarding")) == 2;
}

BOOL HFForceAccessoryAnalyticsOnboarding()
{
  return HFPreferencesBooleanValueForKey(CFSTR("forceAccessoryAnalyticsOnboarding")) == 2;
}

id HFStoreStagingURLString()
{
  return HFPreferencesStringForKey(CFSTR("HFStoreStagingURLStringKey"));
}

BOOL HFForceInstallationGuideUseStagingURL()
{
  return HFPreferencesBooleanValueForKey(CFSTR("HFForceInstallationGuideUseStagingURLKey")) == 2;
}

id HFStoreInstallationGuideStagingURLString()
{
  return HFPreferencesStringForKey(CFSTR("HFStoreInstallationGuideStagingURLStringKey"));
}

id _HFPreferencesGetAccessoryDictionary(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  CFPropertyListRef v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  v1 = a1;
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    v2 = HFPreferencesBooleanValueForKey(CFSTR("InternalDebuggingEnabled"));
    v3 = (id)MEMORY[0x1E0C9AA70];
    if (v2 == 2)
    {
      if (!v1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary *_HFPreferencesGetAccessoryDictionary(NSString *__strong)");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("HFPreferences.m"), 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryUUID"));

      }
      if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1)
        dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_225);
      v4 = (void *)MEMORY[0x1DF0DABF0]();
      v5 = CFPreferencesCopyAppValue((CFStringRef)objc_msgSend(v1, "stringByAppendingString:", CFSTR("-AccessoryDictionary")), CFSTR("com.apple.Home"));
      v6 = (void *)v5;
      if (v5)
        v7 = (void *)v5;
      else
        v7 = v3;
      v3 = v7;

      objc_autoreleasePoolPop(v4);
    }
  }
  else
  {
    v3 = (id)MEMORY[0x1E0C9AA70];
  }

  return v3;
}

void _HFPreferencesSetAccessoryDictionary(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a1;
  v3 = a2;
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall")
    && HFPreferencesBooleanValueForKey(CFSTR("InternalDebuggingEnabled")) == 2)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _HFPreferencesSetAccessoryDictionary(NSString *__strong, NSDictionary *__strong)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HFPreferences.m"), 486, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryUUID"));

    }
    if (!objc_msgSend(v3, "count"))
    {

      v3 = 0;
    }
    CFPreferencesSetAppValue((CFStringRef)objc_msgSend(v6, "stringByAppendingString:", CFSTR("-AccessoryDictionary")), v3, CFSTR("com.apple.Home"));
  }

}

void HFPreferencesAccessorySetValueForKey(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  _HFPreferencesGetAccessoryDictionary(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);
  _HFPreferencesSetAccessoryDictionary(v7, v9);

}

id HFPreferencesAccessoryValueForKey(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  _HFPreferencesGetAccessoryDictionary(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void HFPreferencesSetInternalDebuggingEnabled(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __CFString *v3;
  id v4;
  const void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _InstallHomePreferencesObserverIfNecessary_onceToken;
  v3 = CFSTR("InternalDebuggingEnabled");
  v4 = v1;
  v7 = v4;
  if (v2 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_225);
    v5 = v7;
  }
  CFPreferencesSetAppValue(CFSTR("InternalDebuggingEnabled"), v5, CFSTR("com.apple.Home"));

  CFPreferencesSynchronize(CFSTR("com.apple.Home"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.Home.preferenceschanged"), 0, 0, 1u);

}

BOOL HFPreferencesShowDoublePaneEnergyForecast()
{
  _BOOL8 result;

  result = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (result)
    return HFPreferencesBooleanValueForKey(CFSTR("ShowDoublePaneEnergyForecast")) == 2;
  return result;
}

BOOL HFPreferenceIdentifyHomePodButtonEnabled()
{
  _BOOL8 result;

  result = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (result)
    return HFPreferencesBooleanValueForKey(CFSTR("HFPreferenceIdentifyHomePodButtonEnabledKey")) == 2;
  return result;
}

id HFPerformanceUpgradeTitles()
{
  if (qword_1ED379910 != -1)
    dispatch_once(&qword_1ED379910, &__block_literal_global_224_0);
  return (id)qword_1ED379918;
}

BOOL HFForceHideEmptyFavoriteScenes()
{
  _BOOL8 result;

  result = +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall");
  if (result)
    return HFPreferencesBooleanValueForKey(CFSTR("HFForceHideEmptyFavoriteScenes")) == 2;
  return result;
}

void _HomePrefsChangedHandler()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.Home.preferenceschanged"), 0);

}

void _HomeDPrefsChangedHandler()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.homed.preferenceschanged"), 0);

}

void sub_1DD59A8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD59F094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5A2B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v25 - 144), 8);
  _Block_object_dispose((const void *)(v25 - 112), 8);
  _Unwind_Resume(a1);
}

id _HFStateDumpBuilderForMediaProfileContainer(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
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

  v3 = a1;
  v4 = a2;
  v5 = &unk_1F0449888;
  v6 = v3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "conformsToProtocol:", v5))
      v8 = v7;
    else
      v8 = 0;
    v9 = v7;
    if (v8)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v12);

  }
  v9 = 0;
LABEL_8:

  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", v7, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendObject:withName:options:", v14, CFSTR("UUID"), 2);

  objc_msgSend(v7, "hf_backingAccessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
  objc_msgSend(v13, "appendObject:withName:context:options:", v15, CFSTR("accessory"), v16, 1);

  objc_msgSend(v7, "hf_backingAccessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firmwareVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendObject:withName:options:", v18, CFSTR("firmware version"), 1);

  objc_msgSend(v7, "hf_parentRoom");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendObject:withName:", v19, CFSTR("room"));

  objc_msgSend(v13, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "hf_isReachable"), CFSTR("reachable"), 0);
  objc_msgSend(v13, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "hf_isCurrentAccessory"), CFSTR("currentAccessory"), 1);
  objc_msgSend(v13, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "hf_homePodSupportsMultiUser"), CFSTR("supportsMultiUser"), 1);
  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(v7, "mediaSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendObject:withName:", v20, CFSTR("mediaSession"));

    objc_msgSend(v7, "settings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendObject:withName:", v21, CFSTR("settings"));

  }
  return v13;
}

void sub_1DD5A8C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5A925C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_1DD5AB230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5AB4A0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD5AB9FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5ABAE0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5AEAEC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD5AEC34(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5AF354(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5AF960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5AFE3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1DD5B0430(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD5B0FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5B15F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5B3484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5B3B80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD5B3EF0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD5B4248(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD5B46D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD5B4A5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD5B4DE0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD5B51BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5B6070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5B6800(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DD5B68CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5B7ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5C0E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5C7D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2(unint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1 < 0x13)
    return qword_1DD669AB8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Yet to handle HMSoftwareUpdateStatusV2: %lu"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x3FuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  NSLog(CFSTR("%@"), v2);
  return 4;
}

void sub_1DD5C86F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5C8FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5CA150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5CA380(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5CAB34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1DD5CACEC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5CC60C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1DD5CC7C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *HFStringForDeviceOrientationSimplified(uint64_t a1)
{
  const __CFString *result;
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;

  switch(a1)
  {
    case 1:
      result = CFSTR("Portrait");
      break;
    case 2:
      result = CFSTR("PortraitUpsideDown");
      break;
    case 3:
      result = CFSTR("LandscapeLeft");
      break;
    case 4:
      result = CFSTR("LandscapeRight");
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "bounds");
      v4 = v3;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6;

      v8 = CFSTR("FaceUp-Landscape");
      v9 = CFSTR("FaceUp-Portrait");
      goto LABEL_9;
    case 6:
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v4 = v11;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v7 = v13;

      v8 = CFSTR("FaceDown-Landscape");
      v9 = CFSTR("FaceDown-Portrait");
LABEL_9:
      if (v4 >= v7)
        result = v8;
      else
        result = v9;
      break;
    default:
      result = CFSTR("Unknown");
      break;
  }
  return result;
}

void sub_1DD5D0004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

void sub_1DD5D2944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5D3C20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD5D4A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5D5680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5D5894(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5D59D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5D8A8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD5DEAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD5DF920(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DD5E3FA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1DD5E5198(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD5E5354(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5E5988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHMUserCameraAccessLevel(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1EA73D108[a1];
}

id HFLocalizedStringFromHMUserCameraAccessLevel(unint64_t a1)
{
  __CFString *v1;

  if (a1 > 2)
    v1 = 0;
  else
    v1 = off_1EA73D108[a1];
  return _HFLocalizedStringWithDefaultValue(v1, 0, 0);
}

void sub_1DD5E7650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5E9A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5E9B40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5EA1DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD5EA8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5EB778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5ED980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1DD5EDF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5EE4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5EE760(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5EEA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5EED6C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD5EF6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5F2DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD5F3108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

HFCharacteristicGroup *HFNewTargetCurrentGroup(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  HFCharacteristicGroup *v14;
  void *v15;
  void *v16;
  HFCharacteristicGroup *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  +[HFCharacteristicGroup _targetCurrentStateCharacteristicTypeMap](HFCharacteristicGroup, "_targetCurrentStateCharacteristicTypeMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v7;
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = v6;
  v13 = v10;
  v14 = [HFCharacteristicGroup alloc];
  _HFLocalizedStringWithDefaultValue(v12, v12, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HFCharacteristicGroup initWithID:title:characteristicTypes:](v14, "initWithID:title:characteristicTypes:", v11, v15, v16);
  return v17;
}

void sub_1DD5F7ED4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD5FB278(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1DD5FB254);
  }
  _Unwind_Resume(a1);
}

void sub_1DD6004F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD6008BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD601EB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1DD602040(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD605DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD607128(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD609E8C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 136));
  _Unwind_Resume(a1);
}

void sub_1DD60AC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD60BFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD60C504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD60C660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HFGetColorForLightTemperature(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  void *v4;
  void *v5;
  float64x2_t *v6;
  int32x2_t v7;
  int64x2_t v8;
  int8x16_t v9;
  _QWORD aBlock[8];
  uint64_t v17;
  float64x2_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = 0;
  v18 = (float64x2_t *)&v17;
  v19 = 0x3810000000;
  v20 = &unk_1DD6D32DE;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __HFGetColorForLightTemperature_block_invoke;
  aBlock[3] = &unk_1EA73E8D0;
  aBlock[4] = &v17;
  aBlock[5] = a1;
  aBlock[6] = a2;
  aBlock[7] = a3;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (a4 >= 1000.0 && a4 <= 40000.0)
  {
    v6 = v18;
    v7 = vdup_n_s32(a4 > 6500.0);
    v8.i64[0] = v7.u32[0];
    v8.i64[1] = v7.u32[1];
    v9 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v8, 0x3FuLL));
    __asm { FMOV            V1.2D, #1.0 }
    v18[2] = vmaxnmq_f64(vminnmq_f64(vaddq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)xmmword_1DD669D30, (int8x16_t)xmmword_1DD669D20), vdivq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)xmmword_1DD669D70, (int8x16_t)xmmword_1DD669D60), vaddq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)xmmword_1DD669D50, (int8x16_t)xmmword_1DD669D40), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0)))), _Q1), (float64x2_t)0);
    v6[3].f64[0] = fmax(fmin(-8257.79973 / (a4 + 2575.28275) + 1.89937539, 1.0), 0.0);
  }
  if (v4)
    (*((void (**)(void *))v4 + 2))(v4);

  _Block_object_dispose(&v17, 8);
}

void sub_1DD6106D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

void HFConvertRGBToHSB(long double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;

  if (a4 < a5 || a4 < a6)
  {
    if (a5 < a4 || a5 < a6)
    {
      if (a5 >= a4)
        v9 = a4;
      else
        v9 = a5;
      v10 = a6;
    }
    else
    {
      if (a4 >= a6)
        v9 = a6;
      else
        v9 = a4;
      v10 = a5;
    }
  }
  else
  {
    if (a5 >= a6)
      v9 = a6;
    else
      v9 = a5;
    v10 = a4;
  }
  v11 = 0.0;
  if (v10 <= 0.0)
  {
    v13 = 0.0;
  }
  else
  {
    v12 = v10 - v9;
    v13 = (v10 - v9) / v10;
    if (v13 != 0.0)
    {
      v14 = (v10 - a5) / v12;
      v15 = (v10 - a6) / v12;
      if (v10 == a4)
      {
        if (v9 == a5)
          v11 = v15 + 5.0;
        else
          v11 = 1.0 - v14;
      }
      else
      {
        v16 = v10 == a5;
        v17 = (v10 - a4) / v12;
        if (v16)
        {
          if (v9 == a6)
            v11 = v17 + 1.0;
          else
            v11 = 3.0 - v15;
        }
        else if (v9 == a4)
        {
          v11 = v14 + 3.0;
        }
        else
        {
          v11 = 5.0 - v17;
        }
      }
    }
  }
  if (a3)
    *a3 = v10;
  if (a1)
    *a1 = fmod(v11 / 6.0, 1.0);
  if (a2)
    *a2 = v13;
}

BOOL HFIsColorLighter(void *a1, double a2, double a3)
{
  double v5;
  uint64_t v7;
  double v8;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  v7 = 0;
  v8 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v10, &v9, &v8, &v7);
  v5 = (v10 * 255.0 + v9 * 255.0 + v8 * 255.0) / 3.0;
  if (v5 >= a2 * 255.0)
    return v5 > 242.25
        || sqrt(((v8 * 255.0 - v5) * (v8 * 255.0 - v5)+ (v10 * 255.0 - v5) * (v10 * 255.0 - v5)+ (v9 * 255.0 - v5) * (v9 * 255.0 - v5))/ 3.0) <= a3;
  return v5 > 242.25;
}

BOOL HFIsNearYellow(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0;
  v4 = 0.0;
  v2 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  return v4 * 255.0 >= 237.150009 && v5 * 255.0 >= 237.150009;
}

id HFGetUIColorFromMired(double a1)
{
  float v1;
  double v3;
  double v4;
  double v5;

  v1 = 1000000.0 / a1;
  v5 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  HFGetColorForLightTemperature((uint64_t)&v5, (uint64_t)&v4, (uint64_t)&v3, v1);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v5, v4, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1DD610E14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1DD613044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DD618C98(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD619440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD61A5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD61BE28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD61C394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _HFCharacteristicMetadataTypeIsReallyBinary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "minimumValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToNumber:", &unk_1EA7CD540))
  {
    objc_msgSend(v1, "maximumValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToNumber:", &unk_1EA7CD558))
    {
      objc_msgSend(v1, "stepValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_1EA7CD558);

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t HFAccessorySettingsDefaultInterfaceModalityForHMAccessorySetting(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = 0;
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v2 = -1;
      goto LABEL_21;
    }
    v3 = v1;
    objc_msgSend(v3, "minimumValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1EA7CD570))
    {
      objc_msgSend(v3, "maximumValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqual:", &unk_1EA7CD588) & 1) != 0)
      {
        objc_msgSend(v3, "stepValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqual:", &unk_1EA7CD588);

        if ((v7 & 1) != 0)
        {
          v2 = 5;
LABEL_20:

          goto LABEL_21;
        }
LABEL_13:
        objc_msgSend(v3, "maximumValue");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8
          && (v9 = (void *)v8,
              objc_msgSend(v3, "minimumValue"),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v10,
              v9,
              v10))
        {
          objc_msgSend(v3, "stepValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            v2 = 3;
          else
            v2 = 2;

        }
        else
        {
          v2 = 1;
        }
        goto LABEL_20;
      }

    }
    goto LABEL_13;
  }
  v2 = 6;
LABEL_21:

  return v2;
}

void sub_1DD62014C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromAFVoiceGender(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Any");
  else
    return off_1EA7402B0[a1 - 1];
}

void sub_1DD62C274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

const __CFString *HFMediaAccessoryItemTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("Unknown");
  else
    return off_1EA7408F0[a1 - 1];
}

void sub_1DD631708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD632898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD6329B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DD633E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD633F20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getMediaServiceConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ED379E98)
    qword_1ED379E98 = _sl_dlopen();
  if (!qword_1ED379E98)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaSetupLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("HFMediaServiceManager.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MediaServiceConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMediaServiceConfigurationClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("HFMediaServiceManager.m"), 23, CFSTR("Unable to find class %s"), "MediaServiceConfiguration");

LABEL_8:
    __break(1u);
  }
  qword_1ED379E90 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL HMCharacteristicValueLabelNamespaceValidate(unint64_t a1)
{
  return a1 < 2;
}

id HFProgrammableSwitchLocalizableStringForAccessoryNamingSystemAndIndex(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (a1 > 1)
  {
    v8 = 0;
  }
  else if (a1 == 1)
  {
    HFLocalizedStringWithFormat(CFSTR("HFProgrammableSwitch_Numeral_FormatString"), CFSTR("%1lu"), a3, a4, a5, a6, a7, a8, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%lu"), CFSTR("HFProgrammableSwitch"), CFSTR("DOTS"), a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v9, 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_UndefinedIdx"), CFSTR("HFProgrammableSwitch"), CFSTR("DOTS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _HFLocalizedStringWithDefaultValue(v11, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v8;
}

const __CFString *HFLocalizedStringKeyFromHMCharacteristicValueInputEvent(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("HFProgrammableSwitchUndefinedValue");
  else
    return off_1EA7412E0[a1];
}

id HFProgrammableSwitchInputEventOptionDisplayPriorityMap()
{
  if (qword_1ED379EC8 != -1)
    dispatch_once(&qword_1ED379EC8, &__block_literal_global_232);
  return (id)_MergedGlobals_329;
}

__CFString *HFProgrammableSwitchLocalizedStringKeyForValue(void *a1)
{
  unint64_t v1;

  if (!a1)
    return CFSTR("HFProgrammableSwitchUndefinedValue");
  v1 = objc_msgSend(a1, "integerValue");
  if (v1 > 2)
    return CFSTR("HFProgrammableSwitchUndefinedValue");
  else
    return off_1EA7412E0[v1];
}

id HFUpdateDateAddedForApplicationDataContainer(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_7;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (!v6)
  {
LABEL_7:
    objc_msgSend(v3, "applicationData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("HFApplicationDataDateAddedData"));

    v11 = (void *)MEMORY[0x1E0D519C0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __HFUpdateDateAddedForApplicationDataContainer_block_invoke;
    v13[3] = &unk_1EA7268C8;
    v14 = v3;
    objc_msgSend(v11, "futureWithErrorOnlyHandlerAdapterBlock:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    goto LABEL_8;
  }
  v7 = v6;
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v3;
    v18 = 2112;
    v19 = v7;
    _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Error encoding date added for container %@; error: %@",
      buf,
      0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v9;
}

void sub_1DD63C548(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1DD63CCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DD63CEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HFSymbolIconAccessoryTypeForSymbol(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("."));
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
  else
    objc_msgSend(v1, "substringToIndex:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t sub_1DD63D69C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DD63D6A8()
{
  return MEMORY[0x1E0CB0598]();
}

uint64_t sub_1DD63D6B4()
{
  return MEMORY[0x1E0CB05A0]();
}

uint64_t sub_1DD63D6C0()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1DD63D6CC()
{
  return MEMORY[0x1E0CB05E8]();
}

uint64_t sub_1DD63D6D8()
{
  return MEMORY[0x1E0CB05F8]();
}

uint64_t sub_1DD63D6E4()
{
  return MEMORY[0x1E0CB0608]();
}

uint64_t sub_1DD63D6F0()
{
  return MEMORY[0x1E0CB0610]();
}

uint64_t sub_1DD63D6FC()
{
  return MEMORY[0x1E0CB0630]();
}

uint64_t sub_1DD63D708()
{
  return MEMORY[0x1E0CB0670]();
}

uint64_t sub_1DD63D714()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1DD63D720()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1DD63D72C()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1DD63D738()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1DD63D744()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1DD63D750()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1DD63D75C()
{
  return MEMORY[0x1E0CB0820]();
}

uint64_t sub_1DD63D768()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DD63D774()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1DD63D780()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1DD63D78C()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1DD63D798()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1DD63D7A4()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1DD63D7B0()
{
  return MEMORY[0x1E0CB0968]();
}

uint64_t sub_1DD63D7BC()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1DD63D7C8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DD63D7D4()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1DD63D7E0()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1DD63D7EC()
{
  return MEMORY[0x1E0CB0CB0]();
}

uint64_t sub_1DD63D7F8()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DD63D804()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DD63D810()
{
  return MEMORY[0x1E0CB0F98]();
}

uint64_t sub_1DD63D81C()
{
  return MEMORY[0x1E0CB0FE8]();
}

uint64_t sub_1DD63D828()
{
  return MEMORY[0x1E0CB1018]();
}

uint64_t sub_1DD63D834()
{
  return MEMORY[0x1E0CB1030]();
}

uint64_t sub_1DD63D840()
{
  return MEMORY[0x1E0CB1058]();
}

uint64_t sub_1DD63D84C()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1DD63D858()
{
  return MEMORY[0x1E0CB1408]();
}

uint64_t sub_1DD63D864()
{
  return MEMORY[0x1E0CB1438]();
}

uint64_t sub_1DD63D870()
{
  return MEMORY[0x1E0CB1458]();
}

uint64_t sub_1DD63D87C()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1DD63D888()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1DD63D894()
{
  return MEMORY[0x1E0D33558]();
}

uint64_t sub_1DD63D8A0()
{
  return MEMORY[0x1E0D32150]();
}

uint64_t sub_1DD63D8AC()
{
  return MEMORY[0x1E0D32168]();
}

uint64_t sub_1DD63D8B8()
{
  return MEMORY[0x1E0D32178]();
}

uint64_t sub_1DD63D8C4()
{
  return MEMORY[0x1E0D32180]();
}

uint64_t sub_1DD63D8D0()
{
  return MEMORY[0x1E0D32188]();
}

uint64_t sub_1DD63D8DC()
{
  return MEMORY[0x1E0D32198]();
}

uint64_t sub_1DD63D8E8()
{
  return MEMORY[0x1E0D321A0]();
}

uint64_t sub_1DD63D8F4()
{
  return MEMORY[0x1E0D32258]();
}

uint64_t sub_1DD63D900()
{
  return MEMORY[0x1E0D32270]();
}

uint64_t sub_1DD63D90C()
{
  return MEMORY[0x1E0D322A0]();
}

uint64_t sub_1DD63D918()
{
  return MEMORY[0x1E0D322B0]();
}

uint64_t sub_1DD63D924()
{
  return MEMORY[0x1E0D322C8]();
}

uint64_t sub_1DD63D930()
{
  return MEMORY[0x1E0D322E8]();
}

uint64_t sub_1DD63D93C()
{
  return MEMORY[0x1E0D32308]();
}

uint64_t sub_1DD63D948()
{
  return MEMORY[0x1E0D32350]();
}

uint64_t sub_1DD63D954()
{
  return MEMORY[0x1E0D32358]();
}

uint64_t sub_1DD63D960()
{
  return MEMORY[0x1E0D32360]();
}

uint64_t sub_1DD63D96C()
{
  return MEMORY[0x1E0D32368]();
}

uint64_t sub_1DD63D978()
{
  return MEMORY[0x1E0D32370]();
}

uint64_t sub_1DD63D984()
{
  return MEMORY[0x1E0D32378]();
}

uint64_t sub_1DD63D990()
{
  return MEMORY[0x1E0D323B0]();
}

uint64_t sub_1DD63D99C()
{
  return MEMORY[0x1E0D323C0]();
}

uint64_t sub_1DD63D9A8()
{
  return MEMORY[0x1E0D32490]();
}

uint64_t sub_1DD63D9B4()
{
  return MEMORY[0x1E0D32498]();
}

uint64_t sub_1DD63D9C0()
{
  return MEMORY[0x1E0D324A0]();
}

uint64_t sub_1DD63D9CC()
{
  return MEMORY[0x1E0D324A8]();
}

uint64_t sub_1DD63D9D8()
{
  return MEMORY[0x1E0D324B0]();
}

uint64_t sub_1DD63D9E4()
{
  return MEMORY[0x1E0D324E0]();
}

uint64_t sub_1DD63D9F0()
{
  return MEMORY[0x1E0D324E8]();
}

uint64_t sub_1DD63D9FC()
{
  return MEMORY[0x1E0D324F0]();
}

uint64_t sub_1DD63DA08()
{
  return MEMORY[0x1E0D324F8]();
}

uint64_t sub_1DD63DA14()
{
  return MEMORY[0x1E0D32508]();
}

uint64_t sub_1DD63DA20()
{
  return MEMORY[0x1E0D32510]();
}

uint64_t sub_1DD63DA2C()
{
  return MEMORY[0x1E0D32518]();
}

uint64_t sub_1DD63DA38()
{
  return MEMORY[0x1E0D32520]();
}

uint64_t sub_1DD63DA44()
{
  return MEMORY[0x1E0D32550]();
}

uint64_t sub_1DD63DA50()
{
  return MEMORY[0x1E0D32578]();
}

uint64_t sub_1DD63DA5C()
{
  return MEMORY[0x1E0D325D8]();
}

uint64_t sub_1DD63DA68()
{
  return MEMORY[0x1E0D325E0]();
}

uint64_t sub_1DD63DA74()
{
  return MEMORY[0x1E0D326C0]();
}

uint64_t sub_1DD63DA80()
{
  return MEMORY[0x1E0D326D0]();
}

uint64_t sub_1DD63DA8C()
{
  return MEMORY[0x1E0D32728]();
}

uint64_t sub_1DD63DA98()
{
  return MEMORY[0x1E0D32730]();
}

uint64_t sub_1DD63DAA4()
{
  return MEMORY[0x1E0D32740]();
}

uint64_t sub_1DD63DAB0()
{
  return MEMORY[0x1E0D32748]();
}

uint64_t sub_1DD63DABC()
{
  return MEMORY[0x1E0D32758]();
}

uint64_t sub_1DD63DAC8()
{
  return MEMORY[0x1E0D32760]();
}

uint64_t sub_1DD63DAD4()
{
  return MEMORY[0x1E0D32768]();
}

uint64_t sub_1DD63DAE0()
{
  return MEMORY[0x1E0D32778]();
}

uint64_t sub_1DD63DAEC()
{
  return MEMORY[0x1E0D32788]();
}

uint64_t sub_1DD63DAF8()
{
  return MEMORY[0x1E0D32798]();
}

uint64_t sub_1DD63DB04()
{
  return MEMORY[0x1E0D327A8]();
}

uint64_t sub_1DD63DB10()
{
  return MEMORY[0x1E0D327B0]();
}

uint64_t sub_1DD63DB1C()
{
  return MEMORY[0x1E0D327B8]();
}

uint64_t sub_1DD63DB28()
{
  return MEMORY[0x1E0D327C0]();
}

uint64_t sub_1DD63DB34()
{
  return MEMORY[0x1E0D327D0]();
}

uint64_t sub_1DD63DB40()
{
  return MEMORY[0x1E0D32828]();
}

uint64_t sub_1DD63DB4C()
{
  return MEMORY[0x1E0D32830]();
}

uint64_t sub_1DD63DB58()
{
  return MEMORY[0x1E0D32838]();
}

uint64_t sub_1DD63DB64()
{
  return MEMORY[0x1E0D32840]();
}

uint64_t sub_1DD63DB70()
{
  return MEMORY[0x1E0D32858]();
}

uint64_t sub_1DD63DB7C()
{
  return MEMORY[0x1E0D32860]();
}

uint64_t sub_1DD63DB88()
{
  return MEMORY[0x1E0D32870]();
}

uint64_t sub_1DD63DB94()
{
  return MEMORY[0x1E0D32880]();
}

uint64_t sub_1DD63DBA0()
{
  return MEMORY[0x1E0D32888]();
}

uint64_t sub_1DD63DBAC()
{
  return MEMORY[0x1E0D32890]();
}

uint64_t sub_1DD63DBB8()
{
  return MEMORY[0x1E0D32898]();
}

uint64_t sub_1DD63DBC4()
{
  return MEMORY[0x1E0D328A0]();
}

uint64_t sub_1DD63DBD0()
{
  return MEMORY[0x1E0D328A8]();
}

uint64_t sub_1DD63DBDC()
{
  return MEMORY[0x1E0D328B0]();
}

uint64_t sub_1DD63DBE8()
{
  return MEMORY[0x1E0D328C8]();
}

uint64_t sub_1DD63DBF4()
{
  return MEMORY[0x1E0D328E8]();
}

uint64_t sub_1DD63DC00()
{
  return MEMORY[0x1E0D32970]();
}

uint64_t sub_1DD63DC0C()
{
  return MEMORY[0x1E0D32980]();
}

uint64_t sub_1DD63DC18()
{
  return MEMORY[0x1E0D329A8]();
}

uint64_t sub_1DD63DC24()
{
  return MEMORY[0x1E0D329B0]();
}

uint64_t sub_1DD63DC30()
{
  return MEMORY[0x1E0D329B8]();
}

uint64_t sub_1DD63DC3C()
{
  return MEMORY[0x1E0D329C0]();
}

uint64_t sub_1DD63DC48()
{
  return MEMORY[0x1E0D329D8]();
}

uint64_t sub_1DD63DC54()
{
  return MEMORY[0x1E0D32D80]();
}

uint64_t sub_1DD63DC60()
{
  return MEMORY[0x1E0D32D98]();
}

uint64_t sub_1DD63DC6C()
{
  return MEMORY[0x1E0D32DC8]();
}

uint64_t sub_1DD63DC78()
{
  return MEMORY[0x1E0D32DE0]();
}

uint64_t sub_1DD63DC84()
{
  return MEMORY[0x1E0D32DF8]();
}

uint64_t sub_1DD63DC90()
{
  return MEMORY[0x1E0D32E18]();
}

uint64_t sub_1DD63DC9C()
{
  return MEMORY[0x1E0D32E20]();
}

uint64_t sub_1DD63DCA8()
{
  return MEMORY[0x1E0D32E40]();
}

uint64_t sub_1DD63DCB4()
{
  return MEMORY[0x1E0D32E48]();
}

uint64_t sub_1DD63DCC0()
{
  return MEMORY[0x1E0D32E90]();
}

uint64_t sub_1DD63DCCC()
{
  return MEMORY[0x1E0D32EA8]();
}

uint64_t sub_1DD63DCD8()
{
  return MEMORY[0x1E0D32EC0]();
}

uint64_t sub_1DD63DCE4()
{
  return MEMORY[0x1E0D32EC8]();
}

uint64_t sub_1DD63DCF0()
{
  return MEMORY[0x1E0D32ED0]();
}

uint64_t sub_1DD63DCFC()
{
  return MEMORY[0x1E0D32ED8]();
}

uint64_t sub_1DD63DD08()
{
  return MEMORY[0x1E0D32EE0]();
}

uint64_t sub_1DD63DD14()
{
  return MEMORY[0x1E0D32F08]();
}

uint64_t sub_1DD63DD20()
{
  return MEMORY[0x1E0D32F10]();
}

uint64_t sub_1DD63DD2C()
{
  return MEMORY[0x1E0D32F18]();
}

uint64_t sub_1DD63DD38()
{
  return MEMORY[0x1E0D32F38]();
}

uint64_t sub_1DD63DD44()
{
  return MEMORY[0x1E0D32F40]();
}

uint64_t sub_1DD63DD50()
{
  return MEMORY[0x1E0D32F48]();
}

uint64_t sub_1DD63DD5C()
{
  return MEMORY[0x1E0D32F50]();
}

uint64_t sub_1DD63DD68()
{
  return MEMORY[0x1E0D32F90]();
}

uint64_t sub_1DD63DD74()
{
  return MEMORY[0x1E0D32FE0]();
}

uint64_t sub_1DD63DD80()
{
  return MEMORY[0x1E0D32FF8]();
}

uint64_t sub_1DD63DD8C()
{
  return MEMORY[0x1E0D33010]();
}

uint64_t sub_1DD63DD98()
{
  return MEMORY[0x1E0D33018]();
}

uint64_t sub_1DD63DDA4()
{
  return MEMORY[0x1E0D33028]();
}

uint64_t sub_1DD63DDB0()
{
  return MEMORY[0x1E0D33030]();
}

uint64_t sub_1DD63DDBC()
{
  return MEMORY[0x1E0D33038]();
}

uint64_t sub_1DD63DDC8()
{
  return MEMORY[0x1E0D33070]();
}

uint64_t sub_1DD63DDD4()
{
  return MEMORY[0x1E0D33088]();
}

uint64_t sub_1DD63DDE0()
{
  return MEMORY[0x1E0D330A0]();
}

uint64_t sub_1DD63DDEC()
{
  return MEMORY[0x1E0D330D8]();
}

uint64_t sub_1DD63DDF8()
{
  return MEMORY[0x1E0D330F0]();
}

uint64_t sub_1DD63DE04()
{
  return MEMORY[0x1E0D33108]();
}

uint64_t sub_1DD63DE10()
{
  return MEMORY[0x1E0D33110]();
}

uint64_t _s4Home7HFEventV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x1E0D33118]();
}

uint64_t _s4Home7HFEventV4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x1E0D33120]();
}

uint64_t sub_1DD63DE34()
{
  return MEMORY[0x1E0D33130]();
}

uint64_t sub_1DD63DE40()
{
  return MEMORY[0x1E0D33730]();
}

uint64_t sub_1DD63DE4C()
{
  return MEMORY[0x1E0D33740]();
}

uint64_t sub_1DD63DE58()
{
  return MEMORY[0x1E0D33748]();
}

uint64_t sub_1DD63DE64()
{
  return MEMORY[0x1E0D33770]();
}

uint64_t sub_1DD63DE70()
{
  return MEMORY[0x1E0D33780]();
}

uint64_t sub_1DD63DE7C()
{
  return MEMORY[0x1E0D33798]();
}

uint64_t sub_1DD63DE88()
{
  return MEMORY[0x1E0D33888]();
}

uint64_t sub_1DD63DE94()
{
  return MEMORY[0x1E0D33890]();
}

uint64_t sub_1DD63DEA0()
{
  return MEMORY[0x1E0D33898]();
}

uint64_t sub_1DD63DEAC()
{
  return MEMORY[0x1E0D338A0]();
}

uint64_t sub_1DD63DEB8()
{
  return MEMORY[0x1E0D338C0]();
}

uint64_t sub_1DD63DEC4()
{
  return MEMORY[0x1E0D338D8]();
}

uint64_t sub_1DD63DED0()
{
  return MEMORY[0x1E0D338F8]();
}

uint64_t sub_1DD63DEDC()
{
  return MEMORY[0x1E0D33920]();
}

uint64_t sub_1DD63DEE8()
{
  return MEMORY[0x1E0D329E8]();
}

uint64_t sub_1DD63DEF4()
{
  return MEMORY[0x1E0D329F0]();
}

uint64_t sub_1DD63DF00()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DD63DF0C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DD63DF18()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DD63DF24()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1DD63DF30()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1DD63DF3C()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1DD63DF48()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1DD63DF54()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1DD63DF60()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1DD63DF6C()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1DD63DF78()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1DD63DF84()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1DD63DF90()
{
  return MEMORY[0x1E0CB7858]();
}

uint64_t sub_1DD63DF9C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1DD63DFA8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DD63DFB4()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DD63DFC0()
{
  return MEMORY[0x1E0D1F360]();
}

uint64_t sub_1DD63DFCC()
{
  return MEMORY[0x1E0D1F368]();
}

uint64_t sub_1DD63DFD8()
{
  return MEMORY[0x1E0D1F370]();
}

uint64_t sub_1DD63DFE4()
{
  return MEMORY[0x1E0D1F380]();
}

uint64_t sub_1DD63DFF0()
{
  return MEMORY[0x1E0D1F388]();
}

uint64_t sub_1DD63DFFC()
{
  return MEMORY[0x1E0D1F390]();
}

uint64_t sub_1DD63E008()
{
  return MEMORY[0x1E0D1F3A8]();
}

uint64_t sub_1DD63E014()
{
  return MEMORY[0x1E0D1F3B8]();
}

uint64_t sub_1DD63E020()
{
  return MEMORY[0x1E0D1F3C0]();
}

uint64_t sub_1DD63E02C()
{
  return MEMORY[0x1E0D1F3C8]();
}

uint64_t sub_1DD63E038()
{
  return MEMORY[0x1E0D1F3D0]();
}

uint64_t sub_1DD63E044()
{
  return MEMORY[0x1E0D1F3D8]();
}

uint64_t sub_1DD63E050()
{
  return MEMORY[0x1E0D1F3F0]();
}

uint64_t sub_1DD63E05C()
{
  return MEMORY[0x1E0D1F3F8]();
}

uint64_t sub_1DD63E068()
{
  return MEMORY[0x1E0D1F400]();
}

uint64_t sub_1DD63E074()
{
  return MEMORY[0x1E0D1F408]();
}

uint64_t sub_1DD63E080()
{
  return MEMORY[0x1E0DE9D78]();
}

uint64_t sub_1DD63E08C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DD63E098()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1DD63E0A4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1DD63E0B0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1DD63E0BC()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1DD63E0C8()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1DD63E0D4()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1DD63E0E0()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1DD63E0EC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1DD63E0F8()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1DD63E104()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1DD63E110()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DD63E11C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DD63E128()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1DD63E134()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1DD63E140()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1DD63E14C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DD63E158()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1DD63E164()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1DD63E170()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1DD63E17C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DD63E188()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DD63E194()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DD63E1A0()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1DD63E1AC()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1DD63E1B8()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_1DD63E1C4()
{
  return MEMORY[0x1E0DEAB48]();
}

uint64_t sub_1DD63E1D0()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DD63E1DC()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DD63E1E8()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1DD63E1F4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DD63E200()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1DD63E20C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DD63E218()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1DD63E224()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DD63E230()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1DD63E23C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1DD63E248()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1DD63E254()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DD63E260()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1DD63E26C()
{
  return MEMORY[0x1E0DEAEA0]();
}

uint64_t sub_1DD63E278()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1DD63E284()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DD63E290()
{
  return MEMORY[0x1E0DF05C0]();
}

uint64_t sub_1DD63E29C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1DD63E2A8()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1DD63E2B4()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1DD63E2C0()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1DD63E2CC()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1DD63E2D8()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1DD63E2E4()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1DD63E2F0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DD63E2FC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DD63E308()
{
  return MEMORY[0x1E0DF0770]();
}

uint64_t sub_1DD63E314()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1DD63E320()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1DD63E32C()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1DD63E338()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1DD63E344()
{
  return MEMORY[0x1E0DF08A0]();
}

uint64_t sub_1DD63E350()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1DD63E35C()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1DD63E368()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1DD63E374()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1DD63E380()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1DD63E38C()
{
  return MEMORY[0x1E0CB1BB8]();
}

uint64_t sub_1DD63E398()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1DD63E3A4()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1DD63E3B0()
{
  return MEMORY[0x1E0DEB230]();
}

uint64_t sub_1DD63E3BC()
{
  return MEMORY[0x1E0DEB248]();
}

uint64_t sub_1DD63E3C8()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1DD63E3D4()
{
  return MEMORY[0x1E0DEB278]();
}

uint64_t sub_1DD63E3E0()
{
  return MEMORY[0x1E0DEB2E0]();
}

uint64_t sub_1DD63E3EC()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_1DD63E3F8()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1DD63E404()
{
  return MEMORY[0x1E0DEB340]();
}

uint64_t sub_1DD63E410()
{
  return MEMORY[0x1E0DEB360]();
}

uint64_t sub_1DD63E41C()
{
  return MEMORY[0x1E0DEB370]();
}

uint64_t sub_1DD63E428()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1DD63E434()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1DD63E440()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1DD63E44C()
{
  return MEMORY[0x1E0D32A18]();
}

uint64_t sub_1DD63E458()
{
  return MEMORY[0x1E0CB7860]();
}

uint64_t sub_1DD63E464()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DD63E470()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1DD63E47C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DD63E488()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DD63E494()
{
  return MEMORY[0x1E0D32A38]();
}

uint64_t sub_1DD63E4A0()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DD63E4AC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1DD63E4B8()
{
  return MEMORY[0x1E0CB20C8]();
}

uint64_t sub_1DD63E4C4()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1DD63E4D0()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1DD63E4DC()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1DD63E4E8()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1DD63E4F4()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1DD63E500()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1DD63E50C()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1DD63E518()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1DD63E524()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DD63E530()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1DD63E53C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DD63E548()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DD63E554()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1DD63E560()
{
  return MEMORY[0x1E0CB24F0]();
}

uint64_t sub_1DD63E56C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1DD63E578()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1DD63E584()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DD63E590()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1DD63E59C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1DD63E5A8()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1DD63E5B4()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1DD63E5C0()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1DD63E5CC()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1DD63E5D8()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1DD63E5E4()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1DD63E5F0()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1DD63E5FC()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1DD63E608()
{
  return MEMORY[0x1E0DEC108]();
}

uint64_t sub_1DD63E614()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1DD63E620()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1DD63E62C()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1DD63E638()
{
  return MEMORY[0x1E0DEC140]();
}

uint64_t sub_1DD63E644()
{
  return MEMORY[0x1E0CB25C8]();
}

uint64_t sub_1DD63E650()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1DD63E65C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1DD63E668()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1DD63E674()
{
  return MEMORY[0x1E0DF0B00]();
}

uint64_t sub_1DD63E680()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1DD63E68C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1DD63E698()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1DD63E6A4()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1DD63E6B0()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1DD63E6BC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DD63E6C8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DD63E6D4()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1DD63E6E0()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1DD63E6EC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DD63E6F8()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1DD63E704()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DD63E710()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1DD63E71C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1DD63E728()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1DD63E734()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1DD63E740()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1DD63E74C()
{
  return MEMORY[0x1E0DF0C08]();
}

uint64_t sub_1DD63E758()
{
  return MEMORY[0x1E0DF0C10]();
}

uint64_t sub_1DD63E764()
{
  return MEMORY[0x1E0DF0C28]();
}

uint64_t sub_1DD63E770()
{
  return MEMORY[0x1E0DF0C40]();
}

uint64_t sub_1DD63E77C()
{
  return MEMORY[0x1E0DF0C50]();
}

uint64_t sub_1DD63E788()
{
  return MEMORY[0x1E0DF0C68]();
}

uint64_t sub_1DD63E794()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DD63E7A0()
{
  return MEMORY[0x1E0DECBF0]();
}

uint64_t sub_1DD63E7AC()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1DD63E7B8()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DD63E7C4()
{
  return MEMORY[0x1E0DECD28]();
}

uint64_t sub_1DD63E7D0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1DD63E7DC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1DD63E7E8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DD63E7F4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DD63E800()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1DD63E80C()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1DD63E818()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1DD63E824()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DD63E830()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1DD63E83C()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1DD63E848()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1DD63E854()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1DD63E860()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DD63E86C()
{
  return MEMORY[0x1E0DF0E78]();
}

uint64_t sub_1DD63E878()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1DD63E884()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1DD63E890()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1DD63E89C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1DD63E8A8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DD63E8B4()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1DD63E8C0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DD63E8CC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DD63E8D8()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DD63E8E4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DD63E8F0()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1DD63E8FC()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1DD63E908()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DD63E914()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DD63E920()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1DD63E92C()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_1DD63E938()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1DD63E944()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_1DD63E950()
{
  return MEMORY[0x1E0CB26E8]();
}

uint64_t sub_1DD63E95C()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x1E0CF3178]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x1E0C91F28](inAudioFile);
}

OSStatus AudioFileCreateWithURL(CFURLRef inFileRef, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inFormat, AudioFileFlags inFlags, AudioFileID *outAudioFile)
{
  return MEMORY[0x1E0C91F30](inFileRef, *(_QWORD *)&inFileType, inFormat, *(_QWORD *)&inFlags, outAudioFile);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C91FC8](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x1E0C92128](inFileURL, outSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x1E0C92158](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CGPoint CGPointFromString(NSString *string)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x1E0CEA038](string);
  result.y = v2;
  result.x = v1;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

uint64_t COAlarmSiriContextTargetReferenceForAccessory()
{
  return MEMORY[0x1E0D14880]();
}

uint64_t COTimerSiriContextTargetReferenceForAccessory()
{
  return MEMORY[0x1E0D148C8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t HMDaysOfTheWeekToDateComponents()
{
  return MEMORY[0x1E0CB8BA8]();
}

uint64_t HMHomeManagerAreAnyAccessoriesConfigured()
{
  return MEMORY[0x1E0CB8E50]();
}

uint64_t HMHomeManagerOptionsToString()
{
  return MEMORY[0x1E0CB9050]();
}

uint64_t HMHomeWalletKeyColorAsString()
{
  return MEMORY[0x1E0CB9318]();
}

uint64_t HMNetworkStatusAsString()
{
  return MEMORY[0x1E0CB9760]();
}

uint64_t HMResidentDeviceCapabilitiesDescription()
{
  return MEMORY[0x1E0CB98E8]();
}

uint64_t HMResidentDeviceStatusDescription()
{
  return MEMORY[0x1E0CB9910]();
}

uint64_t HMSetupAccessoryProgressAsString()
{
  return MEMORY[0x1E0CB9B80]();
}

uint64_t HMSiriEndpointOnboardingResultAsString()
{
  return MEMORY[0x1E0CB9BA0]();
}

uint64_t HMSoftwareUpdateUpdateTypeToString()
{
  return MEMORY[0x1E0CB9D98]();
}

uint64_t HMStringFromCameraClipQuality()
{
  return MEMORY[0x1E0CB9DB8]();
}

uint64_t HMStringFromCameraSignificantEventReason()
{
  return MEMORY[0x1E0CB9DC8]();
}

uint64_t HMStringFromHomeLocation()
{
  return MEMORY[0x1E0CB9DD0]();
}

uint64_t HMUserPrivilegeToString()
{
  return MEMORY[0x1E0CB9FD8]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4C8]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x1E0D51970]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x1E0CB2960]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0CEB680](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0CEB688](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t areHomesConfigured()
{
  return MEMORY[0x1E0CBA9D0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

uint64_t createDescriptionForMetriclogFile()
{
  return MEMORY[0x1E0DDD0A0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F80](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

uint64_t localizationKeyForAccessoryCategoryType()
{
  return MEMORY[0x1E0CBACE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x1E0CCFD00]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1E0CCFE20](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE48](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1E0CCFE88](path, *(_QWORD *)&interface_type);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

uint64_t setupAWDConnection()
{
  return MEMORY[0x1E0DDD0B0]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1E0DEEBC0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBC8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1E0DEECD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t teardownAWDConnection()
{
  return MEMORY[0x1E0DDD0B8]();
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1E0DE5958](*(_QWORD *)&c);
}

uint64_t ulistfmt_close()
{
  return MEMORY[0x1E0DE6348]();
}

uint64_t ulistfmt_format()
{
  return MEMORY[0x1E0DE6358]();
}

uint64_t ulistfmt_open()
{
  return MEMORY[0x1E0DE6368]();
}

