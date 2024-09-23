void sub_1000047E4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v8 = HFLogForCategory(50, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v10), "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138413058;
    v14 = v12;
    v15 = 2080;
    v16 = "-[HSPCGuestAccessTableViewController commitConfiguration]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%@:%s) completed _enableAccessToGuestPinCodeItems. result = %@, error = %@", (uint8_t *)&v13, 0x2Au);

  }
}

NAFuture *__cdecl sub_1000048EC(id a1, id a2)
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7ED0);
}

NAFuture *__cdecl sub_100004900(id a1, NSError *a2)
{
  _UNKNOWN **v2;

  if (-[NSError na_isCancelledError](a2, "na_isCancelledError"))
    v2 = &off_1000A7EB8;
  else
    v2 = &off_1000A7ED0;
  return (NAFuture *)(id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v2));
}

void sub_100005620(id a1, NSError *a2, int64_t a3)
{
  uint64_t v4;
  NSError *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v5 = a2;
  if (v5)
  {
    v6 = HFLogForCategory(60, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005DE70((uint64_t)v5, v7);

  }
  v8 = HFLogForCategory(60, v4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = HMSiriEndpointOnboardingResultAsString(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v12, 0xCu);

  }
}

id sub_100005C2C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "voiceName"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputVoiceGenderCode"));
    v5 = +[HFUtilities outputGenderFromString:](HFUtilities, "outputGenderFromString:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "voiceName"));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](AFLocalization, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputVoiceLanguageCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "voiceNamesForOutputLanguageCode:gender:", v11, v5));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputLanguageCode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recognitionLanguage"));
  if (objc_msgSend(v13, "isEqualToString:", v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputVoiceLanguageCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "languageCode"));
    if (objc_msgSend(v16, "isEqualToString:", v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
      v19 = objc_msgSend(v9, "isEqualToString:", v18);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

id sub_100005DF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_100005E00(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = a2;
  v5 = objc_opt_class(UIViewController, v4);
  v9 = v3;
  if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
    v6 = v9;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
    objc_msgSend(v8, "pushViewController:animated:", v7, 1);

  }
}

id sub_100005F88()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubheadline, 32770, 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v0, 0.0));

  return v1;
}

id sub_100005FEC()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubheadline, 0x8000, 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v0, 0.0));

  return v1;
}

void sub_1000064F8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = a2;
  v5 = objc_opt_class(UIViewController, v4);
  v9 = v3;
  if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
    v6 = v9;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
    objc_msgSend(v8, "pushViewController:animated:", v7, 1);

  }
}

void sub_1000073EC(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userDidRespondToConsentRequestForSetupAccessoryDescription:withResponse:", *(_QWORD *)(a1 + 40), 3);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "navigationController"));
  v2 = objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

id sub_100007444(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userDidRespondToConsentRequestForSetupAccessoryDescription:withResponse:", *(_QWORD *)(a1 + 40), 2);
}

void sub_1000076C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000076E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPINCodeLengthMin:", a2);
  objc_msgSend(WeakRetained, "setPINCodeLengthMax:", a3);
  objc_msgSend(WeakRetained, "_updateSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "textFieldText"));
  objc_msgSend(WeakRetained, "_updateContinueActionEnabledFor:", v5);

}

void sub_100007A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100007AAC(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pinCodeManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUserPinCode"));

  return v3;
}

void sub_100007AFC(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pinCodeValue"));

  if (v4)
  {
    v5 = objc_msgSend(v4, "length");
    objc_msgSend((id)qword_1000C3538, "setMinimumIntegerDigits:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C3538, "numberFromString:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000C3538, "stringForObjectValue:", v6));
    objc_msgSend(WeakRetained, "setTextFieldText:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "textField"));
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "continueAction"));
    objc_msgSend(v9, "setEnabled:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "textField"));
    objc_msgSend(v10, "resignFirstResponder");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "addOptionalButtonWithTitleKey:target:futureSelector:", CFSTR("HSProximityCardPINCode_ContinueWithoutPINCodeButton"), WeakRetained, "_skipPINCodeButtonTapped"));
    objc_msgSend(WeakRetained, "setOptionalAction:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "optionalAction"));
    objc_msgSend(v12, "setEnabled:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "continueAction"));
    objc_msgSend(v13, "setEnabled:", 0);

    v14 = HULocalizedString(CFSTR("HUPinCodeEditInstructionFooter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "footnoteLabel"));
    objc_msgSend(v10, "setText:", v6);
  }

}

void sub_100007EC8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

_UNKNOWN **sub_100007F04(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _UNKNOWN **v4;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "coordinator"));
  if (objc_msgSend(v2, "launchReason") == (id)4)
    goto LABEL_4;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "coordinator"));
  if (objc_msgSend(v3, "launchReason") == (id)5)
  {

LABEL_4:
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "coordinator"));
  v7 = objc_msgSend(v6, "launchReason");

  if (v7 != (id)6)
  {
    v4 = &off_1000A7F60;
    goto LABEL_6;
  }
LABEL_5:
  v4 = &off_1000A7F48;
LABEL_6:

  return v4;
}

id sub_100007FBC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id AssociatedObject;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  unsigned int v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v3 = a2;
  v5 = objc_opt_class(HFPinCode, v4);
  AssociatedObject = objc_getAssociatedObject(v3, HFAssociatedPinCodeKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = HFOperationAddExistingUsersPINCodeToNewLock;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v11, "isEqualToString:", HMErrorDomain) || objc_msgSend(v3, "code") != (id)2602)
    goto LABEL_8;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "user"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "home"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentUser"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueIdentifier"));
  v23 = objc_msgSend(v12, "isEqual:", v16);

  if (v23)
  {
    v11 = v10;
    v10 = HFOperationAddPINCode;
LABEL_8:

  }
  v17 = objc_alloc_init((Class)NAFuture);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100008208;
  v26[3] = &unk_1000A0FE0;
  v19 = v17;
  v27 = v19;
  v28 = *(id *)(a1 + 40);
  objc_msgSend(v18, "handleError:operationType:options:retryBlock:cancelBlock:", v3, v10, 0, 0, v26);

  v20 = v28;
  v21 = v19;

  return v21;
}

void sub_100008208(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v1, "finishWithResult:", v3);

}

id sub_10000824C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pinCodeManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUserPinCode"));

  return v3;
}

id sub_10000829C(id *a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (a2)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_updatePINCodesForAllUsers"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000091B8;
    v20[3] = &unk_1000A1198;
    v20[4] = v5;
    v21 = a1[4];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v20));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009214;
    v18[3] = &unk_1000A1120;
    v19 = a1[5];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recover:", v18));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "textFieldText"));
    v29 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFPinCodeManager asciiStringForLocalizedPINString:error:](HFPinCodeManager, "asciiStringForLocalizedPINString:error:", v9, &v29));
    v11 = v29;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pinCodeManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "checkForValidationErrorsWithPINCodeValue:originalPINCode:", v10, 0));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100008504;
    v26[3] = &unk_1000A1058;
    v14 = a1[4];
    v27 = v11;
    v28 = v14;
    v6 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recover:", v26));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000897C;
    v22[3] = &unk_1000A1170;
    v22[4] = v5;
    v23 = v10;
    v24 = a1[4];
    v25 = a1[5];
    v16 = v10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "flatMap:", v22));

  }
  return v8;
}

id sub_100008504(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v3 = a2;
  v4 = objc_alloc_init((Class)NAFuture);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", HFErrorUserInfoOptionsKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", HFErrorHandlerOptionRetryButtonTextKey));

  if (v7)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000086EC;
    v22[3] = &unk_1000A1030;
    v23 = v3;
    v24 = v4;
    v25 = *(id *)(a1 + 40);
    v8 = objc_retainBlock(v22);

  }
  else
  {
    v8 = 0;
  }
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    v10 = v9;

    v3 = v10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  v12 = HFOperationChangePINCodeValue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008820;
  v18[3] = &unk_1000A1030;
  v19 = v3;
  v13 = v4;
  v20 = v13;
  v21 = *(id *)(a1 + 40);
  v14 = v3;
  objc_msgSend(v11, "handleError:operationType:options:retryBlock:cancelBlock:", v14, v12, 0, v8, v18);

  v15 = v21;
  v16 = v13;

  return v16;
}

void sub_1000086EC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "code");
  v4 = HFLogForCategory(50, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2 == (id)77)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Optional PIN Code validation was dismissed by user. Proceeding to set PIN Code. %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }
  else
  {
    if (v6)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown PIN Code validation error requested retry. Closing prox card without setting PIN Code. %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "finishWithResult:", v11);

  }
}

void sub_100008820(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;

  v2 = (uint64_t *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "code") == (id)75
    || objc_msgSend((id)*v2, "code") == (id)74
    || objc_msgSend((id)*v2, "code") == (id)77
    || objc_msgSend((id)*v2, "code") == (id)82)
  {
    v4 = HFLogForCategory(50, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *v2;
      v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Mandatory PIN Code validation. Remaining on this prox card so user can fix issue. %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", &off_1000A7F78);
  }
  else
  {
    v7 = HFLogForCategory(50, v3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10005DEE4(v2, v8);

    v9 = *(void **)(a1 + 40);
    v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "finishWithResult:", v11);

  }
}

id sub_10000897C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v3 = a2;
  v5 = objc_opt_class(NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v3));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pinCodeManager"));
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentUser"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setUserPinCode:forUser:", v8, v11));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100008B54;
    v20[3] = &unk_1000A1080;
    v20[4] = *(_QWORD *)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addSuccessBlock:", v20));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100008D34;
    v19[3] = &unk_1000A10D0;
    v19[4] = *(_QWORD *)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recover:", v19));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008FF0;
    v16[3] = &unk_1000A1148;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flatMap:", v16));

  }
  return v6;
}

void sub_100008B54(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;

  v3 = a2;
  v5 = HFLogForCategory(50, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2080;
    v20 = "-[HSPCPINCodeTextFieldViewController commitConfiguration]_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed adding new User PIN Code.", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateOnboardingFlags");
  v8 = objc_alloc((Class)HFPinCodeItem);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));
  v11 = objc_msgSend(v8, "initWithPinCode:inHome:onAccessory:", v3, v10, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config", HFAnalyticsDataHomeKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "home"));
  v16[0] = v13;
  v16[1] = &off_1000A7F60;
  v15[1] = HFAnalyticsAccessCodeOperationTypeKey;
  v15[2] = HFAnalyticsAccessCodeItem;
  v15[3] = HFAnalyticsAccessCodeDuringOnboardingKey;
  v16[2] = v11;
  v16[3] = &__kCFBooleanTrue;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 26, v14);
}

id sub_100008D34(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  _QWORD v22[4];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;

  v3 = a2;
  v5 = HFLogForCategory(50, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v24 = v7;
    v25 = 2080;
    v26 = "-[HSPCPINCodeTextFieldViewController commitConfiguration]_block_invoke";
    v27 = 2112;
    v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Adding new User PIN Code failed %@", buf, 0x20u);
  }

  v8 = objc_alloc_init((Class)NAFuture);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addedAccessory"));
  if (!objc_msgSend(v10, "supportsCHIP"))
    goto LABEL_8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if ((objc_msgSend(v11, "isEqualToString:", HMErrorDomain) & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  v12 = objc_msgSend(v3, "code");

  if (v12 != (id)2602)
  {
LABEL_9:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
    v14 = HFOperationAddPINCode;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100008FE8;
    v19[3] = &unk_1000A10A8;
    v20 = v8;
    objc_msgSend(v13, "handleError:operationType:options:retryBlock:cancelBlock:", v3, v14, 0, 0, v19);

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateOnboardingFlags");
  objc_msgSend(v8, "finishWithNoResult");
LABEL_10:
  v21[0] = HFAnalyticsDataHomeKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "home"));
  v22[0] = v16;
  v22[1] = &off_1000A7F60;
  v21[1] = HFAnalyticsAccessCodeOperationTypeKey;
  v21[2] = HFAnalyticsAccessCodeDuringOnboardingKey;
  v21[3] = HFAnalyticsDataErrorKey;
  v22[2] = &__kCFBooleanTrue;
  v22[3] = v3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 26, v17);
  return v8;
}

id sub_100008FE8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

id sub_100008FF0(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "coordinator"));
  if (objc_msgSend(v2, "launchReason") == (id)5)
  {

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "coordinator"));
    v4 = objc_msgSend(v3, "launchReason");

    if (v4 != (id)6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "_updatePINCodesForAllUsers"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000915C;
      v13[3] = &unk_1000A10F8;
      v14 = a1[5];
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v13));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000091AC;
      v11[3] = &unk_1000A1120;
      v12 = a1[6];
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recover:", v11));

      return v7;
    }
  }
  v5 = (*((uint64_t (**)(void))a1[5] + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v6));

  return v7;
}

id sub_10000915C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v2));

  return v3;
}

uint64_t sub_1000091AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1000091B8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_updateOnboardingFlags");
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v3));

  return v4;
}

uint64_t sub_100009214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100009588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000095AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = HFLogForCategory(50, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v11 = CFSTR("Failed");
    else
      v11 = CFSTR("Succeeded");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addedAccessory"));
    v14 = 138413570;
    v15 = WeakRetained;
    v16 = 2080;
    v17 = "-[HSPCPINCodeTextFieldViewController _updatePINCodesForAllUsers]_block_invoke";
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ enabling PIN codes for all users on new accessory %@. result: %@, error: %@", (uint8_t *)&v14, 0x3Eu);

  }
}

void sub_10000C1BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 224));
  _Unwind_Resume(a1);
}

id sub_10000C218(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unsigned int v24;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v7), "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (objc_msgSend(v3, "BOOLValue"))
      v10 = CFSTR("Not");
    else
      v10 = &stru_1000A3BA0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", *(_QWORD *)(a1 + 40)));
    v15 = 138413314;
    v16 = v9;
    v17 = 2080;
    v18 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 1024;
    v24 = objc_msgSend(v3, "BOOLValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@ : %s) %@ skipping %@ because hasWalletKeyCompatibleDevice is %{BOOL}d.", (uint8_t *)&v15, 0x30u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v3, "BOOLValue") ^ 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v12));

  return v13;
}

id sub_10000C3B0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int8x16_t v15;
  _QWORD v16[4];
  int8x16_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;

  if ((objc_msgSend(a2, "BOOLValue") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_fetchWalletKeyDeviceStateForCurrentDevice"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000C5B4;
    v19[3] = &unk_1000A1238;
    v21 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    v20 = v6;
    v22 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v19));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C814;
    v16[3] = &unk_1000A1260;
    v18 = *(_QWORD *)(a1 + 48);
    v15 = *(int8x16_t *)(a1 + 32);
    v9 = (id)v15.i64[0];
    v17 = vextq_s8(v15, v15, 8uLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recover:", v16));

  }
  else
  {
    v11 = HFLogForCategory(66, v3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", *(_QWORD *)(a1 + 48)));
      *(_DWORD *)buf = 136315394;
      v24 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
      v25 = 2112;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because this device does not support wallet home key.", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  }
  return v10;
}

id sub_10000C5B4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  int v40;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "walletKey"));
  v5 = objc_msgSend(v4, "isUWBUnlockEnabled");

  v7 = HFLogForCategory(66, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v5)
      v9 = CFSTR("Skipping");
    else
      v9 = CFSTR("Not skipping");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", *(_QWORD *)(a1 + 40)));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hf_minimumDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeUIServiceLaunchUserInfo launchReasonDescription:](HUHomeUIServiceLaunchUserInfo, "launchReasonDescription:", *(_QWORD *)(a1 + 48)));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "walletKey"));
    if (v13)
      v14 = CFSTR("exists");
    else
      v14 = CFSTR("does NOT exist");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "walletKey"));
    v16 = objc_msgSend(v15, "isUWBUnlockEnabled");
    *(_DWORD *)buf = 136317186;
    v24 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    v17 = CFSTR("NOT enabled");
    v26 = v9;
    v25 = 2112;
    if (v16)
      v17 = CFSTR("enabled");
    v27 = 2112;
    v28 = v21;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v17;
    v39 = 1024;
    v40 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) %@ prox card %@ for accessory %@ in home %@. Launch reason = %@. wallet key %@. UWB is %@. shouldSkip so far is %{BOOL}d.", buf, 0x58u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v18));

  return v19;
}

id sub_10000C814(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005DF5C(a1, (uint64_t)v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  return v7;
}

id sub_10000C898(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005E030(a1, (uint64_t)v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  return v7;
}

id sub_10000C91C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;

  if ((objc_msgSend(a2, "BOOLValue") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_fetchWalletKeyDeviceStateForCurrentDevice"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000CAD4;
    v14[3] = &unk_1000A12B0;
    v6 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v15 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v14));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000CF90;
    v12[3] = &unk_1000A10D0;
    v13 = *(id *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recover:", v12));

  }
  else
  {
    v9 = HFLogForCategory(66, v3);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(HSSetupstateMachine:%s) Skipping HSProxCardSetupUIStepWalletKeyExpressMode because this device is does not support wallet key.", buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  }
  return v8;
}

id sub_10000CAD4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  const char *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  unsigned int v59;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 40))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "walletKey"));

    if (v17)
    {
      v19 = HFLogForCategory(66, v18);
      v9 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
        *(_DWORD *)buf = 136315650;
        v45 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
        v46 = 2112;
        v47 = v20;
        v48 = 2112;
        v49 = v21;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(HSSetupstateMachine:%s) Skipping express mode prox card because while adding accessory %@, wallet key already exists for %@", buf, 0x20u);

      }
      goto LABEL_13;
    }
  }
  if (_os_feature_enabled_impl("HomeApp", "wallet_key_uwb"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "walletKey"));
    v6 = objc_msgSend(v5, "isUWBUnlockEnabled");

    if (v6)
    {
      v8 = HFLogForCategory(66, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "walletKey"));
        *(_DWORD *)buf = 136315650;
        v45 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
        v46 = 2112;
        v47 = v10;
        v48 = 2112;
        v49 = v11;
        v12 = "(%s) Skipping Tap to unlock prox card for accessory %@ wallet key %@ has UWB unlock already enabled. Expec"
              "ted behaviour is to NOT show both UWB and TTU. Only show one of them.";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0x20u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "walletKey"));
  v14 = objc_msgSend(v13, "isExpressEnabled");

  if (v14)
  {
    v16 = HFLogForCategory(66, v15);
    v9 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "walletKey"));
      *(_DWORD *)buf = 136315650;
      v45 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
      v46 = 2112;
      v47 = v10;
      v48 = 2112;
      v49 = v11;
      v12 = "(%s) Skipping Tap to unlock prox card for accessory %@ because wallet key %@ has tap to unlock already turned on.";
      goto LABEL_9;
    }
LABEL_13:

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
    goto LABEL_27;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
  v24 = objc_msgSend(v23, "hf_currentUserIsOwner");

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
  v26 = objc_msgSend(v25, "hf_currentUserIsAdministrator");

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
  v28 = objc_msgSend(v27, "hf_hasHomeHubSupportingWalletKey");

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
  v30 = objc_msgSend(v29, "supportsWalletKey") ^ 1;
  if ((v30 & 1) == 0 && (v24 & 1) == 0)
  {
    if ((v28 & v26 & 1) != 0)
    {
      v30 = 0;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
      v30 = objc_msgSend(v31, "hasOnboardedForWalletKey") ^ 1;

    }
  }

  v33 = HFLogForCategory(66, v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = CFSTR("Not Skipping");
    if ((_DWORD)v30)
      v35 = CFSTR("Skipping");
    v43 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
    v38 = v26;
    if (objc_msgSend(v37, "supportsWalletKey"))
      v39 = CFSTR("supports");
    else
      v39 = CFSTR("doesn't support");
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
    *(_DWORD *)buf = 136316930;
    v45 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    v46 = 2112;
    v47 = v43;
    v48 = 2112;
    v49 = v36;
    v50 = 2112;
    v51 = v39;
    v52 = 1024;
    v53 = v24;
    v54 = 1024;
    v55 = v38;
    v56 = 1024;
    v57 = v28;
    v58 = 1024;
    v59 = objc_msgSend(v40, "hasOnboardedForWalletKey");
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "(%s) %@ express mode prox card because %@ %@ wallet key. isOwner: %{BOOL}d  isAdmin: %{BOOL}d  home hub supports wallet key:%{BOOL}d. hasOnboardedForWalletKey:%{BOOL}d", buf, 0x42u);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v41));

LABEL_27:
  return v22;
}

id sub_10000CF90(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005E104((uint64_t)v3, a1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  return v7;
}

id sub_10000D014(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  BOOL v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = objc_msgSend(a1[4], "hf_currentUserIsOwner");
  v6 = objc_msgSend(a1[4], "hf_hasHomeHubSupportingAccessCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "addedAccessory"));
  if (objc_msgSend(v7, "supportsAccessCodes"))
    v8 = (v5 | v6) == 0;
  else
    v8 = 1;
  if (v8)
    v9 = 0;
  else
    v9 = objc_msgSend(v3, "BOOLValue");

  v11 = HFLogForCategory(50, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      v13 = CFSTR("Not");
    else
      v13 = &stru_1000A3BA0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "addedAccessory"));
    v18 = 138413826;
    v19 = WeakRetained;
    v20 = 2080;
    v21 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    v22 = 2112;
    v23 = v13;
    v24 = 1024;
    v25 = objc_msgSend(v14, "supportsAccessCodes");
    v26 = 1024;
    v27 = objc_msgSend(v3, "BOOLValue");
    v28 = 1024;
    v29 = v5;
    v30 = 1024;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ Skipping PIN Code text field prox card. supportsAccessCodes: %{BOOL}d hasValidConstraints: %{BOOL}d  currentUserIsOwner:%{BOOL}d  hubSupported:%{BOOL}d", (uint8_t *)&v18, 0x38u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9 ^ 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v15));

  return v16;
}

id sub_10000D204(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(v3, "count");
  v7 = HFLogForCategory(50, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "description"));
    v11 = objc_opt_class(v9, v10);
    if (v5)
      v12 = CFSTR("Not Skipping");
    else
      v12 = CFSTR("Skipping");
    v16 = 138413314;
    v17 = v11;
    v18 = 2080;
    v19 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]_block_invoke";
    v20 = 2112;
    v21 = v12;
    v22 = 2048;
    v23 = objc_msgSend(v3, "count");
    v24 = 2112;
    v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ guest access because count is %ld for guestPinCodes %@", (uint8_t *)&v16, 0x34u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5 == 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v13));

  return v14;
}

id sub_10000D39C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = HFLogForCategory(50, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10005E1A8(WeakRetained);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
  return v8;
}

uint64_t sub_10000DDD0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  unsigned int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));
  v5 = objc_msgSend(v4, "hf_userIsRestrictedGuest:", v3);

  return v5 ^ 1;
}

id sub_10000DE28(id a1, HMUser *a2)
{
  return -[HMUser hf_prettyDescription](a2, "hf_prettyDescription");
}

id sub_10000EA9C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  unsigned int v18;

  v3 = a2;
  v5 = HFLogForCategory(60, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v17 = 1024;
    v18 = objc_msgSend(v3, "BOOLValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Voice Profile already exists? %{BOOL}d ...", (uint8_t *)&v13, 0x1Cu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLValue")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v10));

  return v11;
}

NAFuture *__cdecl sub_10000EBD0(id a1, NSError *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[HUHomeFeatureOnboardingUtilities isVoiceProfileAvailableOnThisDeviceForLanguage:](HUHomeFeatureOnboardingUtilities, "isVoiceProfileAvailableOnThisDeviceForLanguage:", 0)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v2));

  return (NAFuture *)v3;
}

void sub_10000EC6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10000EC80(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

uint64_t sub_10000ECB8(uint64_t a1, uint64_t a2)
{
  return objc_opt_class(*(_QWORD *)(a1 + 32), a2);
}

void sub_10000FF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000FF88(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isPreloaded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hf_setFaceRecognitionEnabled:", objc_msgSend(v3, "isOn")));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100010078;
    v8[3] = &unk_1000A13D8;
    objc_copyWeak(&v9, v4);
    v7 = objc_msgSend(v6, "addFailureBlock:", v8);

    objc_destroyWeak(&v9);
  }

}

void sub_100010064(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100010078(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005E2E4((uint64_t)v3, v6);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "identifyPeopleFeature"));
  objc_msgSend(v8, "setOn:", 0);

}

id sub_10001031C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

id sub_1000103B8(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)HUConfigurationWrapperViewController), "initWithContentViewController:configurationDelegate:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_100010FF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableSiri");
}

id sub_1000117CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableSiriWithFuture:", *(_QWORD *)(a1 + 40));
}

id sub_1000117D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A8008);
}

void sub_100011B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011B2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    v9 = HFLogForCategory(60, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005E3AC();

    objc_msgSend(WeakRetained, "_setupOnBoardSelectionsWithLanguageValue:", 0);
    objc_msgSend(WeakRetained, "_applyOnBoardingSelectionsWithFuture:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", &stru_1000A14E0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
    v13 = objc_opt_class(NSArray, v12);
    v14 = v11;
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100012054;
    v50[3] = &unk_1000A1508;
    v18 = (id)objc_opt_new(NSMutableSet, v17);
    v51 = v18;
    objc_msgSend(v16, "na_each:", v50);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
    objc_msgSend(v19, "setAvailableSiriLanguageValues:", v16);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
    objc_msgSend(v21, "setListOfVoices:", v20);

    v23 = HFLogForCategory(60, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "listOfVoices"));
      *(_DWORD *)buf = 138412546;
      v54 = v45;
      v55 = 2112;
      v56 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Successfully fetched available Siri languages from HomeKit [%@] list Of Voices = %@", buf, 0x16u);

    }
    if (*(_QWORD *)(a1 + 32) && objc_msgSend(v16, "count"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_languageValueMatchingRecognitionLanguage:outputVoice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32)));
      if (!v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
        objc_msgSend(v29, "setShouldShowSiriRecognitionLanguageSetup:", 1);

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
        objc_msgSend(v30, "setShouldShowVoiceSelectionSetup:", 1);

      }
      v31 = HFLogForCategory(60, v27);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
        v34 = objc_msgSend(v33, "shouldShowSiriRecognitionLanguageSetup");
        *(_DWORD *)buf = 67109120;
        LODWORD(v54) = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "shouldShowSiriRecognitionLanguageSetup %{BOOL}d", buf, 8u);

      }
    }
    else
    {
      v28 = 0;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
    v36 = objc_msgSend(v35, "shouldShowSiriRecognitionLanguageSetup");

    if ((v36 & 1) != 0)
    {
      v38 = HFLogForCategory(60, v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Finishing future as we don't have a languageValue which means we need to show language selection", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &off_1000A7FF0);
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "enablementFlowConfigurationProvider"));

      if (!v40)
      {
        v41 = objc_alloc_init((Class)AFEnablementFlowConfigurationProvider);
        objc_msgSend(WeakRetained, "setEnablementFlowConfigurationProvider:", v41);

      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "enablementConfiguration"));

      if (!v42)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "enablementFlowConfigurationProvider"));
        v52 = *(_QWORD *)(a1 + 40);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_1000120A0;
        v46[3] = &unk_1000A1580;
        v46[4] = WeakRetained;
        v47 = *(id *)(a1 + 40);
        v48 = v28;
        v49 = *(id *)(a1 + 48);
        objc_msgSend(v43, "configurationForEnablementFlow:recognitionLanguageCodes:completion:", 1, v44, v46);

      }
    }

  }
}

BOOL sub_100012010(id a1, HMImmutableSetting *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMImmutableSetting keyPath](a2, "keyPath"));
  v3 = objc_msgSend(v2, "isEqualToString:", HFSiriAvailableLanguagesSettingKeyPath);

  return v3;
}

void sub_100012054(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[HFUtilities voiceInfoFromSettingLanguageValue:](HFUtilities, "voiceInfoFromSettingLanguageValue:", a2));
  objc_msgSend(*(id *)(a1 + 32), "na_safeAddObject:", v3);

}

void sub_1000120A0(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  unsigned int v27;

  v6 = a2;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEnablementConfiguration:", v6);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    objc_msgSend(v8, "setRecognitionLanguage:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "availableSiriLanguageValues"));
    v11 = objc_msgSend(v10, "count");
    if (v11)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "listOfVoices"));
      if (objc_msgSend(v3, "count"))
        v12 = objc_msgSend(v6, "requiresVoiceSelectionForRecognitionLanguage:", *(_QWORD *)(a1 + 40));
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    objc_msgSend(v13, "setShouldShowVoiceSelectionSetup:", v12);

    if (v11)
    {

    }
    v14 = objc_msgSend(v6, "voiceSelectionAllowsRandomSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    objc_msgSend(v15, "setAllowsRandomVoiceSelection:", v14);

  }
  v16 = HFLogForCategory(60, v5);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    v19 = objc_msgSend(v18, "shouldShowVoiceSelectionSetup");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    *(_DWORD *)buf = 67109376;
    v25 = v19;
    v26 = 1024;
    v27 = objc_msgSend(v20, "allowsRandomVoiceSelection");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "requiresVoiceSelectionForRecognitionLanguage = %{BOOL}d - allowsRandomVoiceSelection = %{BOOL}d", buf, 0xEu);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001230C;
  block[3] = &unk_1000A1558;
  block[4] = *(_QWORD *)(a1 + 32);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10001230C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v3 = objc_msgSend(v2, "shouldShowVoiceSelectionSetup");

  if ((v3 & 1) != 0)
  {
    v5 = HFLogForCategory(60, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finishing Use Siri Setup", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "commitConfiguration"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001242C;
    v9[3] = &unk_1000A1530;
    v10 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "addCompletionBlock:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupOnBoardSelectionsWithLanguageValue:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_applyOnBoardingSelectionsWithFuture:", *(_QWORD *)(a1 + 48));
  }
}

id sub_10001242C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void sub_100012804(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "onboardingSelections"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000128B0;
  v8[3] = &unk_1000A15D0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "applyOnboardingSelections:completionHandler:", v6, v8);

}

void sub_1000128B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a2;
  if (v6)
  {
    v7 = HFLogForCategory(60, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10005E498();

  }
  v9 = HFLogForCategory(60, v5);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMSiriEndpointOnboardingResultAsString(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

id sub_100012AB8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "voiceName"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputVoiceGenderCode"));
    v5 = +[HFUtilities outputGenderFromString:](HFUtilities, "outputGenderFromString:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "voiceName"));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](AFLocalization, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputVoiceLanguageCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "voiceNamesForOutputLanguageCode:gender:", v11, v5));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputLanguageCode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recognitionLanguage"));
  if (objc_msgSend(v13, "isEqualToString:", v15))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputVoiceLanguageCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "languageCode"));
    if (objc_msgSend(v16, "isEqualToString:", v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
      v19 = objc_msgSend(v9, "isEqualToString:", v18);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void sub_1000130F4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "onboardingSelections"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000131A0;
  v8[3] = &unk_1000A15D0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "applyOnboardingSelections:completionHandler:", v6, v8);

}

void sub_1000131A0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;

  v6 = a2;
  if (v6)
  {
    v7 = HFLogForCategory(60, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10005E498();

  }
  v9 = HFLogForCategory(60, v5);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMSiriEndpointOnboardingResultAsString(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

id sub_1000132AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void sub_10001357C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id sub_100014548(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setupAccessoryDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupAccessoryPayload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "showCustomCommissioningFlowAlertIfNecessaryForPayload:onViewController:", v5, *(_QWORD *)(a1 + 32)));

  return v6;
}

NAFuture *__cdecl sub_1000145D8(id a1, HMSetupAccessoryPayload *a2)
{
  HMSetupAccessoryPayload *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Continue with payload %@"), v2));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hs_commitConfigurationFutureWithContextMessage:", v4));
  return (NAFuture *)v5;
}

id sub_100014664(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v15;
  id v16;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "customCommissioningFlowFuture flatMap hit error %@", (uint8_t *)&v15, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v8 = v7;
  if (v7 != (void *)HFErrorDomain)
  {

LABEL_7:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    objc_msgSend(v12, "setPairingError:", v3);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hs_commitConfigurationFutureWithContextMessage:", CFSTR("Hit other errors. Displaying the error.")));
    goto LABEL_8;
  }
  v9 = objc_msgSend(v3, "code");

  if (v9 != (id)96)
    goto LABEL_7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hs_commitConfigurationAndDismissFutureWithContextMessage:", CFSTR("User hit Cancel button on custom commissioning flow alert popup. Dismissing.")));
LABEL_8:
  v13 = (void *)v11;

  return v13;
}

id sub_100015AB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableSiri");
}

void sub_100015F50(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015FD8;
  v7[3] = &unk_1000A15D0;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "applyOnboardingSelections:completionHandler:", v4, v7);

}

void sub_100015FD8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a2;
  if (v6)
  {
    v7 = HFLogForCategory(60, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10005E6B0((uint64_t)v6, v8, v9);

  }
  v10 = HFLogForCategory(60, v5);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = HMSiriEndpointOnboardingResultAsString(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 138412290;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

void sub_100016718(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;

  v3 = a2;
  v5 = (void *)objc_opt_new(NSMutableDictionary, v4);
  v7 = (void *)objc_opt_new(NSMutableArray, v6);
  v9 = (void *)objc_opt_new(NSMutableDictionary, v8);
  v11 = (void *)objc_opt_new(NSMutableArray, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recognitionLanguage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("-")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "availableSiriLanguageValues"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000169D8;
  v31[3] = &unk_1000A1688;
  v17 = v14;
  v32 = v17;
  v18 = v5;
  v33 = v18;
  v19 = v11;
  v34 = v19;
  v20 = v9;
  v35 = v20;
  v21 = v7;
  v36 = v21;
  objc_msgSend(v16, "na_each:", v31);

  if (!objc_msgSend(v19, "count"))
  {
    v23 = HFLogForCategory(60, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recognitionLanguage"));
      *(_DWORD *)buf = 138412546;
      v38 = v26;
      v39 = 2112;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "iOS recognitionLanguage [%@] is not included in config.availableSiriLanguageValues. Using localized languages from HomeKit's availableSiriLanguageValues  [%@]", buf, 0x16u);

    }
    v27 = v21;

    v28 = v18;
    v19 = v27;
    v20 = v28;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingComparator:", &stru_1000A16C8));
  objc_msgSend(*(id *)(a1 + 32), "setRecognitionLanguages:", v29);

  v30 = objc_msgSend(v20, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setLocalizedLanguageToLanguageCodeMap:", v30);

  objc_msgSend(v3, "finishWithNoResult");
}

void sub_1000169D8(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputLanguageCode"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputLanguageCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](AFLocalization, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedNameForSiriLanguage:inDisplayLanguage:", v5, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectAtIndexedSubscript:", 0));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    if (!v7)
      goto LABEL_8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", v7));

    if (!v11)
    {
      objc_msgSend(a1[6], "na_safeAddObject:", v7);
      objc_msgSend(a1[7], "setObject:forKey:", v5, v7);
    }
  }
  else if (!v7)
  {
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", v7));

  if (!v12)
  {
    objc_msgSend(a1[8], "na_safeAddObject:", v7);
    objc_msgSend(a1[5], "setObject:forKey:", v5, v7);
  }
LABEL_8:

}

int64_t sub_100016B44(id a1, NSString *a2, NSString *a3)
{
  return -[NSString localizedCompare:](a2, "localizedCompare:", a3);
}

id sub_100017430(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_alloc((Class)HFCAPackageIconDescriptor);
  v5 = objc_msgSend(v4, "initWithPackageIdentifier:state:", v3, HFCAPackageStateKeypad);

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10001750C;
  v12 = &unk_1000A0F18;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult", v9, v10, v11, v12));

  return v7;
}

id sub_10001750C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithIconDescriptor:displayStyle:animated:", *(_QWORD *)(a1 + 40), 1, 1);
}

void sub_100017884(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1000178B0(id a1)
{
  void *v1;
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_openiCloudPreferencesURL](NSURL, "hf_openiCloudPreferencesURL"));
  v2 = objc_msgSend(v3, "openURL:", v1);

}

id sub_100017914(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A8098);
}

id sub_100017924(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const char *v23;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(v4, "BOOLValue");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A8098);
  }
  else
  {
    v8 = HFLogForCategory(50, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = WeakRetained;
      v22 = 2080;
      v23 = "-[HSPCPINCodeViewController commitConfiguration]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%@:%s) Presenting error alert because pinCodeManager returned NO for hasValidConstraints.", buf, 0x16u);
    }

    v18 = HFErrorUserInfoOperationTypeKey;
    v19 = HFOperationAddPINCode;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v11 = objc_alloc((Class)NSError);
    v12 = objc_msgSend(v11, "initWithDomain:code:userInfo:", HFErrorDomain, 83, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100017B24;
    v16[3] = &unk_1000A10A8;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(v13, "handleError:retryBlock:cancelBlock:", v12, 0, v16);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v14;
}

id sub_100017B24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A8098);
}

void sub_100017D1C(id a1, HFServiceLikeItem *a2)
{
  HFServiceLikeItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  HFServiceLikeItem *v7;

  v2 = a2;
  v4 = HFLogForCategory(62, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

}

id sub_100018048(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceLikeItems"));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

  return v6;
}

id sub_100019354(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryUUID"));
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

id sub_1000193C4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryName"));
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

void sub_100019D1C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URL"));
  v3 = objc_msgSend(v4, "openURL:", v2);

}

NAFuture *sub_10001A3B0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUserGivenAccessoryName:", *(_QWORD *)(a1 + 40));
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

void sub_10001B224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B248(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 136315650;
    v18 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
    v19 = 2112;
    v20 = v7;
    v21 = 1024;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Staging CHIP accessory with payload %@ scanningNetworks %{BOOL}d", buf, 0x1Cu);
  }

  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 64) != 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001B3DC;
  v14[3] = &unk_1000A1860;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  v13 = v3;
  v15 = v13;
  objc_msgSend(v9, "stageCHIPAccessoryPairingInStepsWithPayload:delegate:scanningNetworks:completionHandler:", v10, v11, v12, v14);

  objc_destroyWeak(&v16);
}

void sub_10001B3C0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001B3DC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  const char *v26;
  __int16 v27;
  id v28;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    v12 = HFLogForCategory(58, v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315394;
      v26 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
      v27 = 2112;
      v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Staged CHIP accessory. stagedCHIPAccessoryPairingIdentifier: %@", (uint8_t *)&v25, 0x16u);
    }

    objc_msgSend(WeakRetained, "setStagedCHIPPairingIdentifier:", v7);
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v7);
    if (v8)
    {
      v15 = HFLogForCategory(58, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136315394;
        v26 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
        v27 = 2112;
        v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Staged CHIP accessory. devicePairingUUID: %@", (uint8_t *)&v25, 0x16u);
      }

      objc_msgSend(WeakRetained, "setChipDevicePairingUUID:", v8);
      objc_msgSend(WeakRetained, "_updateAccessoryNameWithCHIPPairingIdentifier:", v8);
    }
  }
  else if (objc_msgSend(v9, "hf_isAlreadyPairedError"))
  {
    v18 = HFLogForCategory(58, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315138;
      v26 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Staged CHIP accessory without stagedCHIPAccessoryPairingIdentifier as it is already paired.", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
  }
  else
  {
    if (v9)
      v20 = v9;
    else
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmfUnspecifiedError](NSError, "hmfUnspecifiedError"));
    v22 = v20;
    v23 = HFLogForCategory(58, v21);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10005E884();

    objc_msgSend(WeakRetained, "setPairingError:", v22);
    objc_msgSend(WeakRetained, "setPhase:", 9);
    objc_msgSend(WeakRetained, "_updateStatusTextAndNotifyDelegate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v22);

  }
}

id sub_10001BAF4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createCHIPSetupPayloadStringForStagedPairingWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

id sub_10001BB04(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]_block_invoke";
    v17 = 2112;
    v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Created CHIP setup payload string: %@", buf, 0x16u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001BC58;
  v12[3] = &unk_1000A18D8;
  v7 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v3;
  v8 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v12));
  v10 = objc_msgSend(v9, "addCompletionBlock:", &stru_1000A1918);

  return v9;
}

void sub_10001BC58(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chipDevicePairingUUID"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    objc_msgSend(*(id *)(a1 + 32), "setChipDevicePairingUUID:", v6);

  }
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "targetEcosystem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "extensionMessenger"));
  v9 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "chipDevicePairingUUID"));
  objc_msgSend(v7, "pairDeviceInHome:onboardingPayload:uuid:completionHandler:", v9, v8, v10, v4);

}

void sub_10001BD2C(id a1, id a2, NSError *a3)
{
  id v4;
  NSError *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  NSError *v12;

  v4 = a2;
  v5 = a3;
  v7 = HFLogForCategory(58, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Response from PEA pairing attempt.  Result: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

}

void sub_10001BEE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001BF0C(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;

  v5 = a3;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001C158;
  v32[3] = &unk_1000A1968;
  v33 = a1[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "na_firstObjectPassingTest:", v32));
  objc_msgSend(a1[4], "setCurrentPairing:", v6);

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "currentPairing"));
  if (v7)
  {
    v9 = (void *)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "currentPairing"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "currentPairing"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        WeakRetained = objc_loadWeakRetained(a1 + 6);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject setupDescription](WeakRetained, "setupDescription"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentPairing](WeakRetained, "currentPairing"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        objc_msgSend(v17, "updateAccessoryName:", v19);

        v21 = HFLogForCategory(58, v20);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject setupDescription](WeakRetained, "setupDescription"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessoryName"));
          *(_DWORD *)buf = 138412290;
          v35 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updated Matter accessory name to: %@", buf, 0xCu);

        }
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  v25 = HFLogForCategory(58, v8);
  WeakRetained = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    sub_10005E9D0((uint64_t)v5, WeakRetained, v26, v27, v28, v29, v30, v31);
LABEL_10:

}

id sub_10001C158(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_10001C44C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelStagingForStagingRequestUUID:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void sub_10001C45C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005EA44(a1, (uint64_t)v4, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Canceled staging.  id: %@", (uint8_t *)&v10, 0xCu);
  }

}

void sub_10001C764(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10005EAC8(a1, (uint64_t)v3, v7);

    objc_msgSend(*(id *)(a1 + 40), "rejectDeviceCredentialForStagingRequestUUID:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 136315394;
      v10 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]_block_invoke";
      v11 = 2112;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Confirming device credential: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "confirmDeviceCredentialForStagingRequestUUID:", *(_QWORD *)(a1 + 48));
  }

}

void sub_10001CA14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v8 = HFLogForCategory(58, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10005EB60();

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveThreadScanResults:forStagingRequestUUID:]_block_invoke";
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Selecting Thread network association %@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "selectThreadNetworkAssociation:forStagingRequestUUID:", v5, *(_QWORD *)(a1 + 40));
  }

}

void sub_10001CCC8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v8 = HFLogForCategory(58, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10005EBCC();

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveWiFiScanResults:forStagingRequestUUID:]_block_invoke";
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Selecting WiFi network association %@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "selectWiFiNetworkAssociation:forStagingRequestUUID:", v5, *(_QWORD *)(a1 + 40));
  }

}

void sub_10001D3AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D3F8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = HFLogForCategory(58, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10005EC38((uint64_t)WeakRetained, v4, v5, v6, v7, v8, v9, v10);

  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "phase") == (id)2)
    {
      objc_msgSend(WeakRetained, "_updateStatusTextAndNotifyDelegate:", 1);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", objc_msgSend(WeakRetained, "phase")));
      NSLog(CFSTR("The 'accessory not found' soft timeout timer should only fire if we remain in the 'discoverAccessories' phase for too long, but instead, we're in the %@ phase"), v11);

    }
  }

}

void sub_10001D4B4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = HFLogForCategory(58, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10005EC9C(v4);

  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "phase") == (id)2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 6));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_mappedHMError:](NSError, "hf_mappedHMError:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "context"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "setupAccessoryDescription"));
      objc_msgSend(v8, "setCancellationReason:", v6);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "discoveredAccessoryToPair"));
      objc_msgSend(v9, "updateStatus:error:", 3, v5);

      objc_msgSend(WeakRetained, "setPairingError:", v5);
      objc_msgSend(WeakRetained, "setPhase:", 9);
      v10 = objc_msgSend(WeakRetained, "cancelStagingForCHIPPairing");
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", objc_msgSend(WeakRetained, "phase")));
      NSLog(CFSTR("The 'accessory not found' fatal timeout timer should only fire if we remain in the 'discoverAccessories' phase for too long, but instead, we're in the %@ phase"), v5);
    }

  }
}

void sub_10001DC64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001DC74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10001DFF0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "_enableVoiceRecognition");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v3));

  return v4;
}

id sub_10001E0C8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UNKNOWN **v13;
  uint64_t v14;
  _QWORD v16[4];
  __int128 v17;
  _QWORD v18[4];
  __int128 v19;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v8 = objc_msgSend(v6, "stateMachineConfigurationGetLaunchReason:", v7);

  LOBYTE(v5) = objc_msgSend(v4, "BOOLValue");
  if ((v5 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    objc_msgSend(v12, "setShouldSkipVoiceProfileSetup:", 1);

    if (v8 == (id)3)
      v13 = &off_1000A8110;
    else
      v13 = &off_1000A80F8;
    v14 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v13));
    goto LABEL_9;
  }
  if (v8 != (id)3)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "commitConfiguration"));
LABEL_9:
    v11 = (void *)v14;
    return v11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:](HUHomeFeatureOnboardingUtilities, "checkVoiceProfileAvailabiltyForLanguage:", 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001E270;
  v18[3] = &unk_1000A1210;
  v19 = *(_OWORD *)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v18));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001E398;
  v16[3] = &unk_1000A1AA8;
  v17 = *(_OWORD *)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recover:", v16));

  return v11;
}

id sub_10001E270(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  _UNKNOWN **v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  unsigned int v18;

  v3 = a2;
  v5 = HFLogForCategory(60, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v17 = 1024;
    v18 = objc_msgSend(v3, "BOOLValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Voice Profile already exists? %{BOOL}d ...", (uint8_t *)&v13, 0x1Cu);

  }
  if (objc_msgSend(v3, "BOOLValue"))
    v10 = &off_1000A8110;
  else
    v10 = &off_1000A80F8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v10));

  return v11;
}

id sub_10001E398(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _UNKNOWN **v7;
  void *v8;

  v3 = a2;
  v5 = HFLogForCategory(60, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005ECDC(a1);

  if (+[HUHomeFeatureOnboardingUtilities isVoiceProfileAvailableOnThisDeviceForLanguage:](HUHomeFeatureOnboardingUtilities, "isVoiceProfileAvailableOnThisDeviceForLanguage:", 0))v7 = &off_1000A8110;
  else
    v7 = &off_1000A80F8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v7));

  return v8;
}

void sub_10001E6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E708(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001E718(uint64_t a1)
{

}

id sub_10001E720(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _UNKNOWN **v12;
  int v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  objc_msgSend(v2, "setShouldSkipVoiceProfileSetup:", 1);

  v4 = HFLogForCategory(60, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v14 = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ User has opted to not enable voice recognition. Setting flag to skip voice profile setup flow.", (uint8_t *)&v14, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v11 = objc_msgSend(v9, "stateMachineConfigurationGetLaunchReason:", v10);

  if (v11 == (id)3)
    v12 = &off_1000A8110;
  else
    v12 = &off_1000A80F8;
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithResult:", v12);
}

void sub_10001E874(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  __int128 v10;
  id v11;
  uint64_t v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v5 = objc_msgSend(v3, "stateMachineConfigurationGetLaunchReason:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_checkForiCloudSiriEnabledAndEnableVoiceRecognition"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001E950;
  v9[3] = &unk_1000A1B48;
  v10 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v5;
  v12 = v7;
  v8 = objc_msgSend(v6, "flatMap:", v9);

}

id sub_10001E950(uint64_t a1, void *a2)
{
  void *v3;
  _UNKNOWN **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;

  if ((objc_msgSend(a2, "BOOLValue") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    objc_msgSend(v3, "setShouldSkipVoiceProfileSetup:", 1);

    if (*(_QWORD *)(a1 + 48) == 3)
      v4 = &off_1000A8110;
    else
      v4 = &off_1000A80F8;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithResult:", v4);
  }
  if (*(_QWORD *)(a1 + 48) == 3)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_enableVoiceRecognitionAndCommitConfiguration"));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:](HUHomeFeatureOnboardingUtilities, "checkVoiceProfileAvailabiltyForLanguage:", 0));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001EAD0;
    v15[3] = &unk_1000A1AF8;
    v17 = *(_QWORD *)(a1 + 56);
    v16 = *(_OWORD *)(a1 + 32);
    v9 = objc_msgSend(v8, "addFailureBlock:", v15);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001EB70;
    v12[3] = &unk_1000A1B20;
    v14 = *(_QWORD *)(a1 + 56);
    v13 = *(_OWORD *)(a1 + 32);
    v10 = objc_msgSend(v8, "addSuccessBlock:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithResult:", &off_1000A80F8);
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

void sub_10001EAD0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _UNKNOWN **v7;

  v3 = a2;
  v5 = HFLogForCategory(60, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005ED60(a1);

  if (+[HUHomeFeatureOnboardingUtilities isVoiceProfileAvailableOnThisDeviceForLanguage:](HUHomeFeatureOnboardingUtilities, "isVoiceProfileAvailableOnThisDeviceForLanguage:", 0))v7 = &off_1000A8110;
  else
    v7 = &off_1000A80F8;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithResult:", v7);

}

id sub_10001EB70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSString *v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v3 = HFLogForCategory(60, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Successfully fetched Siri Voice Profile", (uint8_t *)&v9, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finishWithResult:", &off_1000A8110);
}

void sub_10001F330(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;

  if (objc_msgSend(a2, "BOOLValue"))
  {
    v4 = sub_1000593D8(CFSTR("HSProximityCardLockAddedToHomeSubtitle"));
    v9 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(*(id *)(a1 + 32), "setSubtitle:");

  }
  else
  {
    v5 = HFLogForCategory(66, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v11 = v7;
      v12 = 2080;
      v13 = "-[HSPCDoneViewController initWithCoordinator:config:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@: %s) Not adding subtitles about wallet key when adding accessory %@. hasWalletKey returned NO", buf, 0x20u);
    }

  }
}

void sub_10001F5C4(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URL"));
  v3 = objc_msgSend(v4, "openURL:", v2);

}

void sub_10001FF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10001FFB8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributedText"));
  v8 = objc_msgSend(v7, "length");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "setHidden:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 10.0));
    objc_msgSend(v2, "addObject:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 40.0));
    objc_msgSend(v2, "addObject:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -40.0));
    objc_msgSend(v2, "addObject:", v25);

    if (!v8)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastBaselineAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -10.0));
      objc_msgSend(v2, "addObject:", v30);

LABEL_7:
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
      objc_msgSend(v40, "setHidden:", 1);
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v9, "setHidden:", 1);

    if (!v8)
      goto LABEL_7;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
  objc_msgSend(v31, "setHidden:", 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
  v33 = v32;
  if (v5)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "firstBaselineAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastBaselineAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "titleLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "font"));
    objc_msgSend(v38, "_scaledValueForValue:", 18.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36));
    objc_msgSend(v2, "addObject:", v39);

  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 10.0));
    objc_msgSend(v2, "addObject:", v37);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 40.0));
  objc_msgSend(v2, "addObject:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, -40.0));
  objc_msgSend(v2, "addObject:", v50);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "bodyTextView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastBaselineAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, -10.0));
  objc_msgSend(v2, "addObject:", v54);

LABEL_10:
  return v2;
}

id sub_100020D44(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)HUCameraRecordingSettingsModule);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", *(_QWORD *)(a1 + 32)));
  v7 = objc_msgSend(v5, "initWithItemUpdater:cameraProfiles:displayStyle:", v4, v6, 2);

  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

HUItemModuleController *__cdecl sub_100020E18(id a1, HFItemModule *a2)
{
  HFItemModule *v2;
  id v3;

  v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)HUCameraSettingsModuleController), "initWithModule:", v2);

  objc_msgSend(v3, "setUseProxSetupPresentationStyle:", 1);
  return (HUItemModuleController *)v3;
}

void sub_10002123C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000212B8;
  v6[3] = &unk_1000A1C28;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enableMultiUserWithCompletionHandler:", v6);

}

void sub_1000212B8(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a2;
  if (v4)
  {
    v5 = HFLogForCategory(60, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to enable multi user for home with error %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);
  }
  v7 = HFLogForCategory(60, v3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully enabled multi user for home", (uint8_t *)&v9, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void sub_100021764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100021788(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_opt_class(HMHome, v5);
  v7 = v3;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
  objc_msgSend(v10, "setHome:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v11;
}

id sub_1000218CC(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "na_map:", &stru_1000A1C68));
  v4 = HULocalizedString(CFSTR("HUFirstHomeDefaultName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFUtilities uniqueHomeKitNameForName:allNames:](HFUtilities, "uniqueHomeKitNameForName:allNames:", v5, v6));

  objc_msgSend(*(id *)(a1 + 32), "setTextFieldText:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setTextFieldPlaceholderText:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v8;
}

id sub_10002199C(id a1, HMHome *a2)
{
  return -[HMHome name](a2, "name");
}

void sub_100021C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100021C68(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)WeakRetained[8];
  WeakRetained[8] = v3;
  v6 = v3;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_shouldShowSingleContinueButton"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021D38;
  v11[3] = &unk_1000A1A80;
  v12 = WeakRetained;
  v8 = WeakRetained;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v11));

  return v9;
}

id sub_100021D38(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const char *v30;

  v3 = a2;
  v4 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyExpressModeTapToUnlockSubtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  objc_msgSend(v7, "setSubtitle:", v5);

  LODWORD(v5) = objc_msgSend(v3, "BOOLValue");
  v9 = HFLogForCategory(66, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v5)
  {
    if (v11)
    {
      v12 = *v6;
      *(_DWORD *)buf = 138412546;
      v28 = v12;
      v29 = 2080;
      v30 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%@:%s) Showing educational prox card about Wallet Key because shouldShowSingleContinueButton is YES", buf, 0x16u);
    }

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v6, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), *v6, "commitConfiguration"));
    objc_msgSend(*v6, "setContinueAction:", v13);
  }
  else
  {
    if (v11)
    {
      v14 = *v6;
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      v29 = 2080;
      v30 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(%@:%s) Prompting about enabling Express Mode because hasOnboardedForWalletKey is NO", buf, 0x16u);
    }

    v15 = objc_msgSend(*v6, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HSProximityCardWalletKeyExpressModeTapToUnlock_EnableTapToUnlockButton"), *v6, "commitConfiguration");
    v16 = HULocalizedString(CFSTR("HUProximityCardWalletKeyExpressMode_RequireAuthenticationButton_NONE"));
    v13 = objc_claimAutoreleasedReturnValue(v16);
    v17 = objc_alloc_init((Class)LAContext);
    v26 = 0;
    v18 = objc_msgSend(v17, "canEvaluatePolicy:error:", 2, &v26);
    v20 = v26;
    if (v18)
    {
      v21 = HULocalizedBiometryString(CFSTR("HUProximityCardWalletKeyExpressMode_RequireAuthenticationButton"));
      v22 = v13;
      v13 = objc_claimAutoreleasedReturnValue(v21);
    }
    else
    {
      v23 = HFLogForCategory(66, v19);
      v22 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10005EDE8((uint64_t *)v6, (uint64_t)v20, v22);
    }

    v24 = objc_msgSend(*v6, "addOptionalButtonWithTitleKey:target:futureSelector:", v13, *v6, "_requireAuthenticationButtonTapped");
  }

  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
}

NAFuture *__cdecl sub_100021FC4(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  NSError *v11;

  v2 = a2;
  v4 = HFLogForCategory(66, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
    v10 = 2112;
    v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyExpressModeViewController : %s) hf_fetchWalletKeyDeviceState returned error %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return (NAFuture *)v6;
}

void sub_10002209C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v5 = a2;
  v6 = a3;
  v8 = HFLogForCategory(66, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v10), "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138413058;
    v18 = v12;
    v19 = 2080;
    v20 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%@ :%s) Populating mica asset %@. error %@", buf, 0x2Au);

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002220C;
  v14[3] = &unk_1000A0F18;
  v15 = *(id *)(a1 + 40);
  v16 = v5;
  v13 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

id sub_10002220C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithIconDescriptor:displayStyle:animated:", *(_QWORD *)(a1 + 40), 1, 1);
}

void sub_1000226EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_10002272C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCWalletKeyExpressModeViewController _expresssModePassConflictError:](HSPCWalletKeyExpressModeViewController, "_expresssModePassConflictError:", *(_QWORD *)(a1 + 32)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002283C;
  v10[3] = &unk_1000A0F18;
  v10[4] = WeakRetained;
  v11 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002289C;
  v8[3] = &unk_1000A10A8;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v6, "handleError:retryBlock:cancelBlock:", v5, v10, v8);

}

void sub_10002283C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_addWalletKeyWithExpressMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter"));
  v3 = objc_msgSend(v4, "addCompletionBlock:", v2);

}

id sub_10002289C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A81B8);
}

void sub_1000228AC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCWalletKeyExpressModeViewController _expresssModePassConflictError:](HSPCWalletKeyExpressModeViewController, "_expresssModePassConflictError:", *(_QWORD *)(a1 + 32)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000229BC;
  v10[3] = &unk_1000A0F18;
  v10[4] = WeakRetained;
  v11 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000229C8;
  v8[3] = &unk_1000A10A8;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v6, "handleError:retryBlock:cancelBlock:", v5, v10, v8);

}

id sub_1000229BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableExpressModeAfterAuthWithPromise:", *(_QWORD *)(a1 + 40));
}

id sub_1000229C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A81B8);
}

void sub_1000229D8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_enableExpressModeAfterAuthWithPromise:", v3);

}

void sub_100022C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022C4C(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022D20;
  block[3] = &unk_1000A1DC8;
  objc_copyWeak(&v11, a1 + 6);
  v8 = v5;
  v9 = a1[4];
  v10 = a1[5];
  v12 = a2;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
}

void sub_100022D20(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
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
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = HFLogForCategory(66, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v32 = WeakRetained;
      v33 = 2080;
      v34 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke_2";
      v35 = 2112;
      v36 = v22;
      v37 = 2112;
      v38 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "(%@:%s) When evaluating authentication policy, authError = %@. Invalidating laContext %@", buf, 0x2Au);
    }
LABEL_4:

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &off_1000A81B8);
    goto LABEL_16;
  }
  v6 = *(unsigned __int8 *)(a1 + 64);
  v7 = HFLogForCategory(66, v2);
  v5 = objc_claimAutoreleasedReturnValue(v7);
  v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v32 = WeakRetained;
      v33 = 2080;
      v34 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke";
      v35 = 2112;
      v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Authentication failed. Invalidating laContext %@", buf, 0x20u);
    }
    goto LABEL_4;
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v32 = WeakRetained;
    v33 = 2080;
    v34 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke";
    v35 = 2112;
    v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Authentication succeeded to enable express mode Tap to Unlock for currently existing Wallet Key with localAuthenticationContext %@", buf, 0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "externalizedContext"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "home"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hf_enableExpressModeForWalletKeyWithAuthData:", v11));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100023100;
    v29[3] = &unk_1000A1D78;
    v29[4] = WeakRetained;
    v30 = *(id *)(a1 + 48);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flatMap:", v29));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002325C;
    v27[3] = &unk_1000A10D0;
    v28 = *(id *)(a1 + 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recover:", v27));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002332C;
    v24[3] = &unk_1000A1DA0;
    v25 = *(id *)(a1 + 40);
    v26 = WeakRetained;
    v17 = objc_msgSend(v16, "addCompletionBlock:", v24);

  }
  else
  {
    v19 = HFLogForCategory(66, v10);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v32 = WeakRetained;
      v33 = 2080;
      v34 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke";
      v35 = 2112;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(%@:%s) authData is nil. Invalidating laContext %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &off_1000A81A0);
  }

LABEL_16:
}

id sub_100023100(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_walletKeyUUID"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000231BC;
  v8[3] = &unk_1000A1838;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flatMap:", v8));

  return v6;
}

id sub_1000231BC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a2;
  v5 = objc_opt_class(NSUUID, v4);
  v6 = v3;
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "_updateHasOnboardedForWalletKey:", v8);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", &off_1000A81A0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v9;
}

id sub_10002325C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002331C;
  v7[3] = &unk_1000A10A8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "handleError:retryBlock:cancelBlock:", v3, 0, v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v5;
}

id sub_10002331C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A81A0);
}

void sub_10002332C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v3 = HFLogForCategory(66, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2080;
    v10 = "-[HSPCWalletKeyExpressModeViewController _enableExpressModeAfterAuthWithPromise:]_block_invoke_5";
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed hf_enableExpressModeForWalletKeyWithAuthData. Invalidating laContext %@", (uint8_t *)&v7, 0x20u);
  }

}

id sub_100023BEC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHasOnboardedForWalletKey:", a2);
}

NAFuture *__cdecl sub_100023BF8(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A81A0);
}

id sub_100023C0C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[HSPCWalletKeyExpressModeViewController _addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOpt"
          "ions:]_block_invoke_3";
    v11 = 2112;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyExpressModeViewController:%s) Completed adding Wallet Keyfor iPhone with results %@", (uint8_t *)&v9, 0x16u);
  }

  v7 = *(id *)(a1 + 32);
  return v7;
}

id sub_100023CE8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[HSPCWalletKeyExpressModeViewController _addWalletKeyWithiPhoneExpressModeOptions:pairedWatchesExpressModeOpt"
          "ions:]_block_invoke";
    v18 = 2112;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyExpressModeViewController:%s) Failed adding Wallet Key for iPhone with iPhoneWalletKeyError %@", buf, 0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100023E94;
  v14[3] = &unk_1000A10A8;
  v15 = objc_alloc_init((Class)NAFuture);
  v7 = v15;
  v8 = objc_retainBlock(v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  objc_msgSend(v9, "handleError:retryBlock:cancelBlock:", v3, 0, v8);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100023EA4;
  v12[3] = &unk_1000A1E80;
  v13 = *(id *)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v12));

  return v10;
}

id sub_100023E94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A81A0);
}

id sub_100023EA4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100024268(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalytics:", 3);
  return objc_msgSend(*(id *)(a1 + 32), "_addWalletKeyWithoutExpressMode");
}

BOOL sub_100024938(id a1, HFItem *a2)
{
  HFItem *v2;
  uint64_t v3;
  uint64_t v4;
  HFItem *v5;
  HFItem *v6;
  HFItem *v7;
  unsigned __int8 v8;

  v2 = a2;
  v4 = objc_opt_class(HFPinCodeItem, v3);
  v5 = v2;
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = -[HFItem isUnknownGuest](v7, "isUnknownGuest");
  return v8;
}

void sub_100024F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NAFuture *__cdecl sub_100024F4C(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A81D0);
}

id sub_100024F60(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10005EE84(WeakRetained, (uint64_t)v3, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v9 = v8;
  if (v8 == (void *)HFErrorDomain)
  {
    v10 = objc_msgSend(v3, "code");

    if (v10 == (id)96)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hs_commitConfigurationAndDismissFutureWithContextMessage:", CFSTR("User hit Cancel button on custom commissioning flow alert popup. Dismissing.")));

      goto LABEL_12;
    }
  }
  else
  {

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pairingError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", HFErrorUserInfoOptionsKey));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", HFErrorUserInfoOptionDescriptionKey));
  v18 = v17;
  if (!v17)
  {
    v19 = HULocalizedString(CFSTR("HUProximityCardEnterSetupCodeErrorText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "footnoteLabel"));
  objc_msgSend(v20, "setText:", v18);

  if (!v17)
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A81E8));
LABEL_12:

  return v12;
}

void sub_100025680(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v5 = (void *)a1[4];
  v4 = (void *)a1[5];
  v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025728;
  v8[3] = &unk_1000A1F30;
  v9 = v4;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "checkName:inHome:withValidationOptions:completionHandler:", v9, v6, 1, v8);

}

void sub_100025728(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v7 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025800;
  block[3] = &unk_1000A1F08;
  v11 = a4;
  v15 = a2;
  v12 = *(id *)(a1 + 32);
  v13 = v7;
  v14 = *(id *)(a1 + 40);
  v8 = v7;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100025800(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  if (*(_QWORD *)(a1 + 32) || !*(_BYTE *)(a1 + 64))
  {
    v3 = HFLogForCategory(58, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10005EF30(a1, v4, v5);

    v6 = *(void **)(a1 + 32);
    if (v6)
      v7 = v6;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 1));
    v8 = v7;
    v9 = HFOperationNamingObject;
    v10 = objc_msgSend(*(id *)(a1 + 40), "length");
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 40);
      v15 = HFErrorHandlerOptionFailedItemNameKey;
      v16 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    }
    else
    {
      v12 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hf_errorWithOperationType:options:", v9, v12));

    if (v10)
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v13);

  }
  return objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
}

id sub_100025A14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "validateName:", a2);
}

id sub_100025CD8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_100025D18(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "assignAccessory:toRoom:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

void sub_100025D2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v8 = HFLogForCategory(58, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10005EFA8(a1, (uint64_t)v6, v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138412546;
    v13 = v11;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Succesfully applied room %@ | %@", (uint8_t *)&v12, 0x16u);
  }

}

void sub_10002609C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extensionMessenger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userGivenAccessoryName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "selectedPartnerRoom"));
  objc_msgSend(v7, "configureDeviceWithName:room:completionHandler:", v5, v6, v4);

}

void sub_100026620(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Apply accessory %@ name %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateName:completionHandler:", *(_QWORD *)(a1 + 40), v3);
}

void sub_1000266F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005F0B4();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully applied accessory level name %@ to accessory", (uint8_t *)&v10, 0xCu);
  }

}

void sub_1000267D4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_primaryService"));
  objc_msgSend(v5, "updateName:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void sub_100026830(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005F118((uint64_t)v4, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully named Television primary service %@", (uint8_t *)&v10, 0xCu);
  }

}

void sub_10002690C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "updateName:completionHandler:", *(_QWORD *)(a1 + 40), a2);
  v4 = HFLogForCategory(58, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Apply accessory %@ service %@ name %@ (same as accessory name)", (uint8_t *)&v9, 0x20u);
  }

}

void sub_1000269DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005F188();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully applied primary service level name %@ to accessory", (uint8_t *)&v10, 0xCu);
  }

}

void sub_100026C3C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating date added to %@ for %@", buf, 0x16u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hf_updateDateAdded:", v4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026D98;
  v12[3] = &unk_1000A1DA0;
  v13 = *(id *)(a1 + 32);
  v14 = v3;
  v10 = v3;
  v11 = objc_msgSend(v9, "addCompletionBlock:", v12);

}

void sub_100026D98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v5 = a3;
  v6 = a2;
  v8 = HFLogForCategory(58, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10005F1EC((uint64_t)v5, a1, v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updated date added for %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

void sub_100026F78(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Apply service %@ name %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateName:completionHandler:", *(_QWORD *)(a1 + 40), v3);
}

id sub_100027298(id a1, HMService *a2)
{
  HMService *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMService serviceType](v2, "serviceType"));
  v4 = objc_msgSend(v3, "isEqualToString:", HMServiceTypeInputSource);

  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(+[HSSetupStateMachineConfiguration writeVisibilityState:toInputSourceService:](HSSetupStateMachineConfiguration, "writeVisibilityState:toInputSourceService:", &off_1000A8200, v2));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[HSSetupStateMachineConfiguration writeConfigurationState:toService:](HSSetupStateMachineConfiguration, "writeConfigurationState:toService:", 3, v2));
  v6 = (void *)v5;

  return v6;
}

id sub_1000273B0(id a1, HMService *a2)
{
  HMService *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMService serviceType](v2, "serviceType"));
  v4 = objc_msgSend(v3, "isEqualToString:", HMServiceTypeInputSource);

  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(+[HSSetupStateMachineConfiguration writeVisibilityState:toInputSourceService:](HSSetupStateMachineConfiguration, "writeVisibilityState:toInputSourceService:", &off_1000A8218, v2));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[HSSetupStateMachineConfiguration writeConfigurationState:toService:](HSSetupStateMachineConfiguration, "writeConfigurationState:toService:", 2, v2));
  v6 = (void *)v5;

  return v6;
}

id sub_10002762C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeValue:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void sub_10002763C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v4 = a3;
  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005F3A0();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sucesfully wrote targetVisbilityState: %@ to service %@", (uint8_t *)&v11, 0x16u);
  }

}

id sub_1000277B4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateConfigurationState:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void sub_100027818(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10002782C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100027838(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL sub_100027CA4(id a1, HMService *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMService serviceType](a2, "serviceType"));
  v3 = objc_msgSend(v2, "isEqualToString:", HMServiceTypeInputSource);

  return v3;
}

BOOL sub_100027D28(id a1, HMService *a2)
{
  return -[HMService configurationState](a2, "configurationState") != (id)2;
}

uint64_t sub_100027D98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t (**v17)(_QWORD, _QWORD, _QWORD);
  objc_super v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "televisionProfiles"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100027F1C;
  v20[3] = &unk_1000A20E0;
  v10 = v5;
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "na_firstObjectPassingTest:", v20));

  v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_mediaSourceComparator"));
  if (!v12
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaSourceIdentifier")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mediaSourceIdentifier")),
        v15 = ((uint64_t (**)(_QWORD, void *, void *))v12)[2](v12, v13, v14),
        v14,
        v13,
        !v15))
  {
    v19.receiver = *(id *)(a1 + 32);
    v19.super_class = (Class)HSPCNameInputSourcesViewController;
    v16 = objc_msgSendSuper2(&v19, "serviceComparator");
    v17 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v16);
    v15 = ((uint64_t (**)(_QWORD, id, id))v17)[2](v17, v10, v6);

  }
  return v15;
}

id sub_100027F1C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "services"));
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100028488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000284AC(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showActivityIndicatorWithStatus:", &stru_1000A3BA0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000285B4;
  v10[3] = &unk_1000A10A8;
  v10[4] = WeakRetained;
  v4 = objc_msgSend(v3, "afterDelay:performBlock:", v10, 1.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeTuple"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessory"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000285BC;
  v8[3] = &unk_1000A1C28;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "identifyWithCompletionHandler:", v8);

}

id sub_1000285B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideActivityIndicator");
}

void sub_1000285BC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v7)
      sub_10005F49C(a1);

    v6 = objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
    -[NSObject logError:operationDescription:](v6, "logError:operationDescription:", v3, HFOperationIdentifyAccessory);
  }
  else if (v7)
  {
    sub_10005F404(a1, v6);
  }

}

void sub_1000288F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100028910(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  uint64_t v26;
  id v27;
  id v28[2];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32[2];
  id location[2];

  v3 = a2;
  v4 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryQuitFlowConfirmationTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, *(_QWORD *)(a1 + 32), 1));

  if (*(_BYTE *)(a1 + 72))
    v7 = CFSTR("HUProximityCardSetupAccessoryQuitFlow_PostPairingFinishLaterButton");
  else
    v7 = CFSTR("HUProximityCardSetupAccessoryQuitFlow_ExitButton");
  v8 = HULocalizedString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_initWeak(location, *(id *)(a1 + 40));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100028BFC;
  v29[3] = &unk_1000A2158;
  objc_copyWeak(v32, location);
  v31 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v11 = *(void **)(a1 + 64);
  v30 = v10;
  v32[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, v29));
  objc_msgSend(v6, "addAction:", v12);
  if (*(_BYTE *)(a1 + 72))
    v13 = CFSTR("HUProximityCardSetupAccessoryQuitFlow_PostPairingContinueButton");
  else
    v13 = CFSTR("HUCancelTitle");
  v14 = HULocalizedString(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, 0));
  objc_msgSend(v6, "addAction:", v16);

  if (*(_BYTE *)(a1 + 72))
  {
    v17 = v3;
    v18 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryQuitFlow_PostPairingRemoveButton"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_100028D58;
    v25 = &unk_1000A2180;
    v20 = *(void **)(a1 + 48);
    v26 = *(_QWORD *)(a1 + 40);
    v27 = v20;
    objc_copyWeak(v28, location);
    v28[1] = *(id *)(a1 + 64);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, &v22));

    objc_msgSend(v6, "addAction:", v21, v22, v23, v24, v25, v26);
    objc_destroyWeak(v28);

    v3 = v17;
  }
  objc_msgSend(v6, "setPreferredAction:", v12);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v6, 1, 0);

  objc_destroyWeak(v32);
  objc_destroyWeak(location);

}

void sub_100028BC0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_100028BFC(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  if ((objc_opt_respondsToSelector(WeakRetained, "dismissButtonBlock") & 1) != 0)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dismissButtonBlock"));
    v4[2]();

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dismissFuture"));
  objc_msgSend(WeakRetained, "handleButtonDirectiveFuture:", v5);

  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v10[0] = HFAnalyticsDataAccessoryCategoryTypeKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "category"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categoryType"));
    v10[1] = HFAnalyticsResumeSetupSelectedOptionKey;
    v11[0] = v8;
    v11[1] = &off_1000A8248;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

    +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", *(_QWORD *)(a1 + 56), v9);
  }

}

void sub_100028D58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "showActivityIndicatorWithStatus:", &stru_1000A3BA0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dismissButtonAction"));
  objc_msgSend(v4, "setEnabled:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "home"));
  v6 = *(_QWORD *)(a1 + 40);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100028F14;
  v13 = &unk_1000A13D8;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  objc_msgSend(v5, "removeAccessory:completionHandler:", v6, &v10);
  v15[0] = HFAnalyticsDataAccessoryCategoryTypeKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "category", v10, v11, v12, v13));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categoryType"));
  v15[1] = HFAnalyticsResumeSetupSelectedOptionKey;
  v16[0] = v8;
  v16[1] = &off_1000A8260;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", *(_QWORD *)(a1 + 56), v9);
  objc_destroyWeak(&v14);

}

void sub_100028EF4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100028F14(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hideActivityIndicator");
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dismissFuture"));
  objc_msgSend(WeakRetained, "handleButtonDirectiveFuture:", v1);

}

void sub_100028F68(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dismissFuture"));
  objc_msgSend(WeakRetained, "handleButtonDirectiveFuture:", v3);

}

void sub_1000291A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000291C4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "futureReturningDirectiveFromTarget:selector:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48)));
  objc_msgSend(WeakRetained, "handleButtonDirectiveFuture:target:", v2, *(_QWORD *)(a1 + 32));

}

void sub_10002942C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id sub_100029450(uint64_t a1, void *a2)
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = objc_msgSend(a2, "intValue");
  if (v3 == 1)
  {
    v16 = *(void **)(a1 + 32);
    if (v16)
      objc_msgSend(v16, "dismissProxCardFlowAfterExecuting:", 0);
    else
      objc_msgSend(*(id *)(a1 + 48), "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_11;
  }
  if (v3)
  {
LABEL_11:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    return v15;
  }
  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    NSLog(&CFSTR("Coordinator is nil.  Are you sure your HSProxCardConfigurable stored the coordinator passed at initialization"
                 " to self.coordinator?").isa);
    v6 = HFLogForCategory(58, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005F530(v7, v8, v9, v10, v11, v12, v13, v14);

    v4 = *(void **)(a1 + 32);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextViewControllerWithTarget:", *(_QWORD *)(a1 + 40)));
  return v15;
}

void sub_10002950C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hideActivityIndicator");
  if (v6)
  {
    v9 = HFLogForCategory(58, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005F560((uint64_t)v6, v10);

  }
  v11 = objc_opt_class(UIViewController, v8);
  v12 = v5;
  if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "navigationController"));
    objc_msgSend(v15, "pushViewController:animated:", v14, 1);

  }
}

NAFuture *__cdecl sub_1000297A0(id a1, id a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  _UNKNOWN **v7;
  _UNKNOWN **v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v2 = a2;
  v4 = objc_opt_class(NSNumber, v3);
  v5 = v2;
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = v7;
  if (!v7)
  {
    NSLog(CFSTR("Action returned a non valid object.  It should return NSNumber wrapping HSSetupButtonActionDirective"));
    v10 = HFLogForCategory(58, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10005F6F0(v11, v12, v13, v14, v15, v16, v17, v18);

    v8 = &off_1000A8260;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v8));

  return (NAFuture *)v19;
}

void sub_100029930(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100029B14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_100029DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100029DE0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  void *v40;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchedLibraryItems"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v7 = HFLogForCategory(58, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchedLibraryItems"));
      *(_DWORD *)buf = 138412290;
      v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolved to installed app %@", buf, 0xCu);

    }
    v10 = objc_alloc((Class)HULinkedApplicationLibraryItem);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchedLibraryItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
    v13 = objc_msgSend(v10, "initWithApplicationProxy:", v12);
    objc_msgSend(*(id *)(a1 + 32), "setLinkedApplicationItem:", v13);

LABEL_9:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "linkedApplicationItem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "updateWithOptions:", &__NSDictionary0__struct));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002A248;
    v37[3] = &unk_1000A2290;
    v37[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v38, (id *)(a1 + 56));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "flatMap:", v37));
    objc_destroyWeak(&v38);

    goto LABEL_10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchedStoreItems"));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v17 = HFLogForCategory(58, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchedStoreItems"));
      *(_DWORD *)buf = 138412290;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Resolved to app store download %@", buf, 0xCu);

    }
    v20 = objc_alloc((Class)HULinkedApplicationStoreItem);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchedStoreItems"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
    v22 = objc_msgSend(v20, "initWithStoreItem:", v21);
    objc_msgSend(*(id *)(a1 + 32), "setLinkedApplicationItem:", v22);

    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", HMAppStoreIDAppShack)
    && +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    v28 = HFLogForCategory(58, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Resolved to internal store download", buf, 2u);
    }

    v11 = objc_msgSend(objc_alloc((Class)HULinkedApplicationInternalStoreItem), "initWithBundleIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setLinkedApplicationItem:", v11);
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", HMAppStoreIDLocal)
    && +[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    v31 = HFLogForCategory(58, v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Resolved to internal sideload", buf, 2u);
    }

    v11 = objc_msgSend(objc_alloc((Class)HULinkedApplicationInternalSideloadItem), "initWithBundleIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setLinkedApplicationItem:", v11);
    goto LABEL_9;
  }
  v33 = HFLogForCategory(58, v30);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    sub_10005F750(v34);

  v35 = HULocalizedString(CFSTR("HUSetupNetworkRouterAppPunchoutDescription_AppUnknown"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", v36);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
LABEL_10:

  return v25;
}

void sub_10002A22C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_10002A248(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id WeakRetained;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  _QWORD v33[5];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", HFResultDisplayTitleKey));
  v5 = HULocalizedString(CFSTR("HUSetupNetworkRouterAppPunchoutDescription_AppUnknown"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", HFResultApplicationIsInstalled));
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    v9 = HULocalizedString(CFSTR("HUSetupNetworkRouterAppPunchoutDescription_AppInstalled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v4)
    {
      v11 = CFSTR("HUSetupNetworkRouterAppPunchoutDescriptionButtonFormat_AppInstalled");
LABEL_7:
      v14 = HULocalizedStringWithFormat(v11, CFSTR("%@"));
      v15 = objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_13;
    }
    v16 = CFSTR("HUSetupNetworkRouterAppPunchoutDescriptionButtonFormat_AppInstalled_Unknown");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", HFResultApplicationStoreURL));

    if (!v12)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "linkedApplicationItem"));
      v19 = objc_opt_class(HULinkedApplicationInternalSideloadItem, v18);
      isKindOfClass = objc_opt_isKindOfClass(v17, v19);

      if ((isKindOfClass & 1) != 0)
        v21 = CFSTR("HUSetupNetworkRouterAppPunchoutDescription_AppSideload");
      else
        v21 = CFSTR("HUSetupNetworkRouterAppPunchoutDescription_AppUnknown");
      v26 = HULocalizedString(v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v26);
      goto LABEL_17;
    }
    v13 = HULocalizedString(CFSTR("HUSetupNetworkRouterAppPunchoutDescription_AppStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v4)
    {
      v11 = CFSTR("HUSetupNetworkRouterAppPunchoutDescriptionButtonFormat_AppStore");
      goto LABEL_7;
    }
    v16 = CFSTR("HUSetupNetworkRouterAppPunchoutDescriptionButtonFormat_AppStore_Unknown");
  }
  v22 = HULocalizedString(v16);
  v15 = objc_claimAutoreleasedReturnValue(v22);
LABEL_13:
  v6 = (void *)v15;
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", v10);
    v23 = *(void **)(a1 + 32);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002A4D4;
    v33[3] = &unk_1000A2268;
    v33[4] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v6, 0, v33));
    v25 = objc_msgSend(v23, "addAction:", v24);

LABEL_17:
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
  objc_msgSend(v28, "setNeedsUpdateConstraints");

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v29, "bounds");
  objc_msgSend(WeakRetained, "updatePreferredContentSizeForCardWidth:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v31;
}

void sub_10002A4D4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "linkedApplicationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "latestResults"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", HFResultDisplayTitleKey));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "linkedApplicationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "latestResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", HFResultApplicationBundleIdentifier));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "linkedApplicationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "latestResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", HFResultApplicationStoreURL));

  v10 = objc_msgSend(objc_alloc((Class)HFAppPunchoutRequest), "initWithName:bundleID:payloadURL:storeURL:", v12, v6, 0, v9);
  objc_msgSend(*(id *)(a1 + 32), "setPunchoutRequest:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "popupDelegate"));
  objc_msgSend(v11, "pairingPopupDidFinish:", *(_QWORD *)(a1 + 32));

}

id sub_10002AA24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitConfiguration");
}

id sub_10002B0D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPRXLayoutPass");
}

void sub_10002B3D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sharingDevice"));
  v5 = objc_msgSend(v4, "deviceActionType");

  if (v5 != 11 && v5 != 33)
    NSLog(CFSTR("We only support sharing devices with the SFDeviceActionType[Speaker]Setup actionType. Treating this as a speaker anyway"));
  v7 = HFLogForCategory(58, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received request to start pairing a speaker. Calling into Sharing to show the prox card", buf, 2u);
  }

  v9 = objc_alloc_init((Class)SFClient);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sharingDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "home"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002B530;
  v14[3] = &unk_1000A1C28;
  v15 = v3;
  v13 = v3;
  objc_msgSend(v9, "setupDevice:home:completion:", v10, v12, v14);

}

void sub_10002B530(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Request to start pairing speaker finished with error: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void sub_10002B5F0(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "commitConfiguration"));
  objc_msgSend(v1, "handleButtonDirectiveFuture:", v2);

}

id sub_10002B860(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchAirportUtility");
}

id sub_10002B868(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchAppStore");
}

void sub_10002B9DC(id a1, AMSLookupResult *a2, NSError *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  if (!a3)
  {
    v14 = v3;
    v15 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSLookupResult allItems](a2, "allItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", &stru_1000A23A0));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productPageURL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "openURL:", v8));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10002BB1C;
      v11[3] = &unk_1000A23C8;
      v12 = 0;
      v13 = v6;
      v10 = objc_msgSend(v9, "addFailureBlock:", v11);

    }
  }
}

BOOL sub_10002BADC(id a1, AMSLookupItem *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSLookupItem bundleIdentifier](a2, "bundleIdentifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.airport.mobileairportutility"));

  return v3;
}

void sub_10002BB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;

  v3 = HFLogForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10005F790(a1, v4);

}

BOOL sub_10002C2A0(id a1, PRXButton *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PRXButton currentTitle](a2, "currentTitle"));
  v3 = HULocalizedString(CFSTR("HUContinueTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  return v5;
}

id sub_10002CA4C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)HFMediaAccessoryItem), "initWithValueSource:mediaProfileContainer:", *(_QWORD *)(a1 + 32), v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enableDoorbellChime:", *(unsigned __int8 *)(a1 + 40)));
  return v5;
}

BOOL sub_10002CC30(id a1, HFMediaProfileContainer *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HFMediaProfileContainer settings](a2, "settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hf_accessorySettingAtKeyPath:", HFHomePodMediaAccessorySettingKeyPathDoorbellChimeEnabled));

  return v3 != 0;
}

void sub_10002D374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10002DF9C(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000C3548)
  {
    v4 = off_1000A2518;
    v5 = 0;
    qword_1000C3548 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_1000C3548)
    sub_10005F83C(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("SUICOrbView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10005F8B8();
  qword_1000C3540 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_10002E5EC(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "configureAccessoryName"));

  return v2;
}

id sub_10002E628(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "configureAccessoryDateAdded"));

  return v2;
}

id sub_10002E844(id a1, HMAccessory *a2)
{
  return -[HMAccessory name](a2, "name");
}

void sub_10002F630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10002F65C(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)WeakRetained[8];
  WeakRetained[8] = v3;
  v6 = v3;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_shouldShowSingleContinueButton"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002F72C;
  v11[3] = &unk_1000A1A80;
  v12 = WeakRetained;
  v8 = WeakRetained;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flatMap:", v11));

  return v9;
}

NAFuture *sub_10002F72C(uint64_t a1, void *a2)
{
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), *(_QWORD *)(a1 + 32), "commitConfiguration"));
    objc_msgSend(*(id *)(a1 + 32), "setContinueAction:", v5);
  }
  else
  {
    v6 = sub_1000593D8(CFSTR("HSProximityCardWalletKeyUWB_TurnOnUWBButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v4, "addProminentButtonWithTitleKey:target:futureSelector:", v7, *(_QWORD *)(a1 + 32), "commitConfiguration");

    v9 = HULocalizedString(CFSTR("HUNotNowTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = objc_msgSend(*(id *)(a1 + 32), "addOptionalButtonWithTitleKey:target:futureSelector:", v5, *(_QWORD *)(a1 + 32), "_notNowTapped");
  }

  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

id sub_10002F80C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v7;
    v12 = 2080;
    v13 = "-[HSPCWalletKeyUWBViewController initWithCoordinator:config:]_block_invoke_3";
    v14 = 2112;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) hf_fetchWalletKeyDeviceState returned error %@", (uint8_t *)&v10, 0x20u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v8;
}

void sub_10002FE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002FE34(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_enableUWBOfExistingWalletKeyAfterAuthWithPromise:", v3);

}

id sub_1000306E8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHasOnboardedForWalletKey:", a2);
}

NAFuture *__cdecl sub_1000306F4(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A82F0);
}

id sub_100030708(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  int v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v7), "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v12 = 138412802;
    v13 = v9;
    v14 = 2080;
    v15 = "-[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:]_block_invoke_3";
    v16 = 2112;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed adding Wallet Key for iPhone with results %@", (uint8_t *)&v12, 0x20u);

  }
  v10 = *(id *)(a1 + 40);

  return v10;
}

id sub_100030808(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  v3 = a2;
  v5 = HFLogForCategory(66, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32), v7), "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412802;
    v20 = v9;
    v21 = 2080;
    v22 = "-[HSPCWalletKeyUWBViewController _addWalletKeyWithiPhoneUWBOptions:pairedWatchesUWBOptions:]_block_invoke";
    v23 = 2112;
    v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%@:%s) Failed adding Wallet Key for iPhone with iPhoneWalletKeyError %@", buf, 0x20u);

  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000309D8;
  v17[3] = &unk_1000A10A8;
  v18 = objc_alloc_init((Class)NAFuture);
  v10 = v18;
  v11 = objc_retainBlock(v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  objc_msgSend(v12, "handleError:retryBlock:cancelBlock:", v3, 0, v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000309E8;
  v15[3] = &unk_1000A1E80;
  v16 = *(id *)(a1 + 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "flatMap:", v15));

  return v13;
}

id sub_1000309D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A82F0);
}

id sub_1000309E8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100030CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100030CDC(id *a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030DB0;
  block[3] = &unk_1000A1DC8;
  objc_copyWeak(&v11, a1 + 6);
  v12 = a2;
  v8 = v5;
  v9 = a1[4];
  v10 = a1[5];
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
}

void sub_100030DB0(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  _BYTE v35[14];
  __int16 v36;
  uint64_t v37;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_BYTE *)(a1 + 64) && !*(_QWORD *)(a1 + 32))
  {
    v6 = HFLogForCategory(66, v2);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v31 = WeakRetained;
      v32 = 2080;
      v33 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke";
      v34 = 2112;
      *(_QWORD *)v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Authentication succeeded to enable UWB for currently existing Wallet Key with localAuthenticationContext %@", buf, 0x20u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "externalizedContext"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "home"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:", v10, 1));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100031144;
      v28[3] = &unk_1000A1D78;
      v28[4] = WeakRetained;
      v29 = *(id *)(a1 + 48);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flatMap:", v28));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000312A0;
      v26[3] = &unk_1000A10D0;
      v27 = *(id *)(a1 + 48);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recover:", v26));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100031370;
      v23[3] = &unk_1000A1DA0;
      v24 = *(id *)(a1 + 40);
      v25 = WeakRetained;
      v16 = objc_msgSend(v15, "addCompletionBlock:", v23);

    }
    else
    {
      v17 = HFLogForCategory(66, v9);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v31 = WeakRetained;
        v32 = 2080;
        v33 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke";
        v34 = 2112;
        *(_QWORD *)v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(%@:%s) authData is nil. Invalidating LAContext %@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 40), "invalidate");
      objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &off_1000A82F0);
    }

  }
  else
  {
    v4 = HFLogForCategory(66, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v20 = *(unsigned __int8 *)(a1 + 64);
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413314;
      v31 = WeakRetained;
      v32 = 2080;
      v33 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke_2";
      v34 = 1024;
      *(_DWORD *)v35 = v20;
      *(_WORD *)&v35[4] = 2112;
      *(_QWORD *)&v35[6] = v21;
      v36 = 2112;
      v37 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "(%@:%s) When evaluating authentication policy, success = %{BOOL}d. authError = %@. Invalidating LAContext %@", buf, 0x30u);
    }

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &off_1000A8308);
  }

}

id sub_100031144(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_walletKeyUUID"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031200;
  v8[3] = &unk_1000A1838;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flatMap:", v8));

  return v6;
}

id sub_100031200(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a2;
  v5 = objc_opt_class(NSUUID, v4);
  v6 = v3;
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    objc_msgSend(*(id *)(a1 + 32), "_updateHasOnboardedForWalletKey:", v8);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", &off_1000A82F0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v9;
}

id sub_1000312A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031360;
  v7[3] = &unk_1000A10A8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "handleError:retryBlock:cancelBlock:", v3, 0, v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v5;
}

id sub_100031360(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A82F0);
}

void sub_100031370(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v3 = HFLogForCategory(66, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2080;
    v10 = "-[HSPCWalletKeyUWBViewController _enableUWBOfExistingWalletKeyAfterAuthWithPromise:]_block_invoke_5";
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Completed hf_enableUWBForWalletKeyWithAuthData. Invalidating LAContext %@", (uint8_t *)&v7, 0x20u);
  }

}

void sub_1000315FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100031628(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    v6 = HFLogForCategory(66, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005F930((uint64_t)v3, WeakRetained, v7);

  }
}

void sub_100031A44(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "walletKeyDeviceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "walletKey"));

  if (!v3)
    v4 = objc_msgSend(*(id *)(a1 + 32), "_addWalletKeyWithoutUWB");
}

void sub_100031DC4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "popupDelegate"));

  if (v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "popupDelegate"));
    objc_msgSend(v3, "pairingPopupDidCancel:", *(_QWORD *)(a1 + 32));

  }
}

void sub_100032258(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "commitConfiguration"));
  objc_msgSend(v1, "handleButtonDirectiveFuture:", v2);

}

id sub_100032344()
{
  if (qword_1000C3550 != -1)
    dispatch_once(&qword_1000C3550, &stru_1000A25B8);
  return (id)qword_1000C3558;
}

void sub_100032384(id a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = sub_1000323A8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_1000C3558;
  qword_1000C3558 = v2;

}

id sub_1000323A8()
{
  _QWORD v1[2];

  v1[0] = &off_1000A8CC8;
  v1[1] = &off_1000A8CE0;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1, 2));
}

void sub_100033008(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v5 = (void *)a1[4];
  v4 = (void *)a1[5];
  v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000330AC;
  v8[3] = &unk_1000A23C8;
  v9 = v4;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "updateAssistantAccessControl:forHome:completionHandler:", v9, v6, v8);

}

void sub_1000330AC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;

  v3 = a2;
  v5 = HFLogForCategory(60, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      v9 = "Failed to enable personal requests with error %@ for %@, ";
      v10 = v6;
      v11 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v7)
  {
    LOWORD(v12) = 0;
    v9 = "Successfully enabled personal requests";
    v10 = v6;
    v11 = 2;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
}

id sub_100033D90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollToWells");
}

int64_t sub_1000348BC(id a1, HMAccessory *a2, HMAccessory *a3)
{
  HMAccessory *v4;
  HMAccessory *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory hf_userFriendlyLocalizedLowercaseDescription](v4, "hf_userFriendlyLocalizedLowercaseDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory hf_userFriendlyLocalizedLowercaseDescription](v5, "hf_userFriendlyLocalizedLowercaseDescription"));
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    v8 = -[HMAccessory isBridged](v4, "isBridged");
    if (v8 == -[HMAccessory isBridged](v5, "isBridged"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory name](v4, "name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory name](v5, "name"));
      v9 = (int64_t)objc_msgSend(v10, "localizedStandardCompare:", v11);

    }
    else if (-[HMAccessory isBridged](v4, "isBridged"))
    {
      v9 = 1;
    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = (int64_t)objc_msgSend(v6, "localizedStandardCompare:", v7);
  }

  return v9;
}

BOOL sub_1000349C4(id a1, HMAccessory *a2)
{
  return !-[HMAccessory isBridged](a2, "isBridged");
}

BOOL sub_1000349E0(id a1, HMAccessory *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory services](a2, "services"));
  v3 = objc_msgSend(v2, "na_any:", &stru_1000A26A0);

  return v3;
}

BOOL sub_100034A20(id a1, HMService *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMService serviceType](a2, "serviceType"));
  v3 = objc_msgSend(v2, "isEqualToString:", HMServiceTypeValve);

  return v3;
}

id sub_100034A64(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tupleForAccessory:", a2);
}

NSCopying *__cdecl sub_100034A70(id a1, HSAccessoryTuple *a2)
{
  return (NSCopying *)-[HSAccessoryTuple accessoryCategoryOrPrimaryServiceType](a2, "accessoryCategoryOrPrimaryServiceType");
}

void sub_100034DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100034E10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
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
  id v25;

  v25 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "notifyDelegateOfPairingFailureWithError:", v5);
  }
  else if (v25)
  {
    objc_msgSend(WeakRetained, "didReceiveAccessories:");
  }
  else
  {
    objc_msgSend(WeakRetained, "setPairingState:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError na_genericError](NSError, "na_genericError"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAccessoryTuple"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
    objc_msgSend(v10, "setPairingError:", v8);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  objc_msgSend(v11, "logPairingComplete");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  objc_msgSend(v12, "logNumberOfPairedAccessories:", objc_msgSend(v25, "count"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAccessoryTuple"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessory"));
  objc_msgSend(v13, "logAccessory:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAccessoryTuple"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "roomName"));
  if (objc_msgSend(v18, "length"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAccessoryTuple"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "configuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pairingError"));

    if (!v21)
      goto LABEL_11;
  }
  else
  {

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAccessoryTuple"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "configuration"));
  objc_msgSend(v22, "coordinator:updatedConfiguration:", v7, v24);

LABEL_11:
}

void sub_100035318(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id sub_100035340(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  int v29;
  id v30;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isAlreadyPairedError"))
  {
    v5 = HFLogForCategory(58, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stageCHIPAccessory Staged CHIP accessory without stagedCHIPAccessoryPairingIdentifier.", (uint8_t *)&v29, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &stru_1000A3BA0));
    goto LABEL_21;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingError"));
  if (!v8)
    goto LABEL_12;
  v10 = (void *)v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingError"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
  if ((objc_msgSend(v12, "isEqualToString:", HFErrorDomain) & 1) == 0)
  {

    goto LABEL_12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingError"));
  v14 = objc_msgSend(v13, "code");

  if (v14 != (id)6)
  {
LABEL_12:
    v19 = HFLogForCategory(58, v9);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412290;
      v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "stageCHIPAccessory hit error %@", (uint8_t *)&v29, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setPairingError:", v3);
    goto LABEL_15;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingError"));

  v17 = HFLogForCategory(58, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "stageCHIPAccessory Accessory Discovery Timed Out", (uint8_t *)&v29, 2u);
  }

  v3 = (id)v15;
LABEL_15:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusTitle"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, HFErrorUserInfoOptionTitleKey);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusDescription"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, HFErrorUserInfoOptionDescriptionKey);

  v25 = objc_msgSend(v22, "count");
  if (v25)
    v26 = objc_msgSend(v22, "copy");
  else
    v26 = 0;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_errorWithOperationType:options:", 0, v26));

  if (v25)
  objc_msgSend(WeakRetained, "notifyDelegateOfPairingFailureWithError:", v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &stru_1000A3BA0));

  v3 = (id)v27;
LABEL_21:

  return v7;
}

void sub_100035660(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  int8x16_t v22;
  _QWORD v23[4];
  int8x16_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = (uint64_t)v3;
    v29 = 2048;
    v30 = objc_msgSend(v3, "length");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "stagePairingFuture result %@ length %lu", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingError"));
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "delegate"));
    objc_msgSend(v9, "coordinator:updatedConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    v10 = HFLogForCategory(58, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class(*(_QWORD *)(a1 + 40), v12);
      v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v28 = v13;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ pairing starting with partnerConfig: %@ coordinator: %@", buf, 0x2Au);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairStagedCHIPAccessoryToPartnerAppHome"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000358C4;
    v25[3] = &unk_1000A10D0;
    v26 = *(id *)(a1 + 32);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recover:", v25));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000359A0;
    v23[3] = &unk_1000A2780;
    v22 = *(int8x16_t *)(a1 + 32);
    v20 = (id)v22.i64[0];
    v24 = vextq_s8(v22, v22, 8uLL);
    v21 = objc_msgSend(v19, "addSuccessBlock:", v23);

    v9 = v26;
  }

}

id sub_1000358C4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "pairStagedCHIPAccessoryToPartnerAppHome hit error %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setPairingError:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v7;
}

void sub_1000359A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = HFLogForCategory(58, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "pairStagedCHIPAccessoryToPartnerAppHome succeeded.", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v5, "coordinator:updatedConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id sub_100035D04(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") == (id)47)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextUnconfiguredBridgedAccessory"));
    v6 = v4;
LABEL_3:

    v4 = (id)v5;
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") == (id)52 && objc_msgSend(v3, "BOOLValue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "nextUnconfiguredBridgedAccessory"));
    v6 = v7;
    if (v7)
      v8 = v7;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "topAccessoryTuple"));
    v5 = (uint64_t)v8;

    goto LABEL_3;
  }
LABEL_8:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v4));

  return v9;
}

id sub_100035DE0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setActiveTuple:", v3);
  v4 = *(id *)(a1 + 40);
  if (v4 != v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "topAccessoryTuple"));
    v8 = v7;
    if (v7 == *(void **)(a1 + 40))
    {
      v10 = objc_msgSend(v5, "hf_isNetworkRouter");

      if ((v10 & 1) != 0)
      {
LABEL_7:
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100036118;
        v13[3] = &unk_1000A1838;
        v13[4] = *(_QWORD *)(a1 + 32);
        v14 = v3;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v13));

        goto LABEL_8;
      }
    }
    else
    {

    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100035F6C;
    v15[3] = &unk_1000A2820;
    v16 = v5;
    v11 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v15));

    v6 = (void *)v11;
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
LABEL_8:

  return v9;
}

void sub_100035F6C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100036000;
  v6[3] = &unk_1000A27F8;
  v7 = v4;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v7, "updatePendingConfigurationIdentifier:completionHandler:", 0, v6);

}

void sub_100036000(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v11 = 136315394;
    v12 = "-[HSProxCardCoordinator _generateNextStepWithActiveTuple:]_block_invoke_4";
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s clearing pendingConfigurationIdentifier with updatePendingConfigurationIdentifier for accessory %@", (uint8_t *)&v11, 0x16u);
  }

  if (v3)
  {
    v9 = HFLogForCategory(58, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005FAE0(a1, (uint64_t)v3, v10);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_100036118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateNextStepWithActiveTuple:", *(_QWORD *)(a1 + 40));
}

void sub_1000362F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id sub_100036318(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTuple"));
  v4 = objc_msgSend(v3, "currentStep");

  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(WeakRetained, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTuple"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTuple"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hf_prettyDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", *(_QWORD *)(a1 + 40)));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", v4));
    *(_DWORD *)buf = 138413314;
    v41 = v11;
    v42 = 2048;
    v43 = v12;
    v44 = 2112;
    v45 = v15;
    v46 = 2112;
    v47 = v16;
    v48 = 2112;
    v49 = v17;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ tuple %p accessory %@ nextViewController %@->%@", buf, 0x34u);

  }
  if (v4 == (id)54)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 37));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v18));
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeTuple"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "configuration"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "viewControllerForCoordinator:step:", WeakRetained, v4));

    if (v22)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v22));
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider contentForStep:coordinator:config:](HSSetupContentProvider, "contentForStep:coordinator:config:", v4, WeakRetained, v18));
      if (!v24)
        NSLog(CFSTR("No VC found for step %zu"), v4);
      v25 = objc_opt_class(PRXCardContentViewController, v23);
      v26 = v24;
      if ((objc_opt_isKindOfClass(v26, v25) & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v28 = v27;

      if (objc_msgSend(WeakRetained, "requiresIdentifyButton"))
        objc_msgSend(v28, "addIdentifyButtonWithCoordinator:", WeakRetained);
      v30 = objc_opt_class(HSPCDoneViewController, v29);
      v31 = v28;
      if ((objc_opt_isKindOfClass(v31, v30) & 1) != 0)
        v32 = v31;
      else
        v32 = 0;
      v33 = v32;

      if (!v33)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_bridgedConfigurationOrdinalityString"));
        if (objc_msgSend(v35, "length"))
          objc_msgSend(v31, "setBottomTrayTitle:", v35);

      }
      v36 = HFLogForCategory(58, v34);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", v4));
        *(_DWORD *)buf = 138412546;
        v41 = v38;
        v42 = 2112;
        v43 = v26;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Prox Card UI Transition -> %@ | VC: %@", buf, 0x16u);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v26));

    }
  }

  return v19;
}

id sub_1000366F0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  __objc2_prot *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  v5 = objc_opt_class(PRXCardContentViewController, v4);
  v6 = v3;
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v10 = objc_opt_class(HSPCRouterDetectedViewController, v9);
  v11 = v8;
  if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13 || objc_msgSend(v13, "canContinue"))
    objc_msgSend(v11, "addDismissButtonWithCoordinator:", *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector(*(_QWORD *)(a1 + 40), "configureNextViewController:") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "configureNextViewController:", v6);
  v14 = v6;
  v15 = &OBJC_PROTOCOL___HUPreloadableViewController;
  if (objc_msgSend(v14, "conformsToProtocol:", v15))
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hu_preloadContent"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000368A4;
    v21[3] = &unk_1000A1620;
    v22 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "flatMap:", v21));

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v14));
  }

  return v19;
}

NAFuture *sub_1000368A4(uint64_t a1)
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id sub_1000368B8(uint64_t a1, void *a2)
{
  id v3;
  __objc2_prot *v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v3 = a2;
  v4 = &OBJC_PROTOCOL___HSProxCardConfigurable;
  if (objc_msgSend(v3, "conformsToProtocol:", v4))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_opt_respondsToSelector(v6, "shouldSkip");
  if (v6 && (v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shouldSkip"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100036A14;
    v14[3] = &unk_1000A2220;
    v9 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v16 = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flatMap:", v14));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeTuple"));
    objc_msgSend(v11, "logStepStart:", objc_msgSend(v12, "currentStep"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v3));
  }

  return v10;
}

id sub_100036A14(uint64_t a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
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
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unsigned int v30;

  v3 = objc_msgSend(a2, "BOOLValue");
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class(*(_QWORD *)(a1 + 32), v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeTuple"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeTuple"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hf_prettyDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeTuple"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", objc_msgSend(v15, "currentStep")));
    v21 = 138413314;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v16;
    v29 = 1024;
    v30 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ tuple %p accessory %@ nextViewController for step %@ has skip logic and shouldSkip = %d", (uint8_t *)&v21, 0x30u);

  }
  if (v3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextViewControllerWithTarget:", *(_QWORD *)(a1 + 40)));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[HSAccessoryPairingEventLogger sharedLogger](HSAccessoryPairingEventLogger, "sharedLogger"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeTuple"));
    objc_msgSend(v18, "logStepStart:", objc_msgSend(v19, "currentStep"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", *(_QWORD *)(a1 + 48)));
  }
  return v17;
}

void sub_100036C0C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", HFErrorDomain))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == (id)37)
    {
      v7 = HFLogForCategory(58, v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[HSProxCardCoordinator nextViewControllerWithTarget:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Unable to determine next view controller because we have reached HSProxCardSetupUIStepDismiss.  Will dismiss flow", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "dismissProxCardFlowAfterExecuting:", 0);
      goto LABEL_10;
    }
  }
  else
  {

  }
  NSLog(CFSTR("%s Unable to determine the next view controller: %@"), "-[HSProxCardCoordinator nextViewControllerWithTarget:]_block_invoke", v3);
  v10 = HFLogForCategory(58, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10005FB78((uint64_t)v3, v11, v12);

LABEL_10:
}

void sub_100037270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10003729C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessory"));
  if (v4 && (uint64_t)objc_msgSend(v3, "currentStep") <= 45)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", objc_msgSend(v3, "currentStep")));
  else
    v5 = 0;
  if (objc_msgSend(v4, "isBridged"))
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "room"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "room"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "roomForEntireHome"));
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if ((v10 & 1) == 0)
      {

        v5 = 0;
      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pendingConfigurationIdentifier"));
  v12 = v11;
  if (v4 && ((v5 == 0) == (v11 != 0) || v11 && (objc_msgSend(v11, "isEqualToString:", v5) & 1) == 0))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100037478;
    v15[3] = &unk_1000A18D8;
    v16 = v4;
    v17 = v5;
    v18 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v15));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v13;
}

void sub_100037478(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003753C;
  v7[3] = &unk_1000A28C0;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v6 = v3;
  objc_msgSend(v8, "updatePendingConfigurationIdentifier:completionHandler:", v5, v7);

}

void sub_10003753C(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = a1[6];
    v13 = 136315906;
    v14 = "-[HSProxCardCoordinator dismissProxCardFlowAfterExecuting:]_block_invoke_3";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s setting pendingConfigurationIdentifier with updatePendingConfigurationIdentifier for accessory %@ {from: %@, to: %@}", (uint8_t *)&v13, 0x2Au);
  }

  if (v3)
  {
    v11 = HFLogForCategory(58, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10005FBF4(a1, (uint64_t)v3, v12);

  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_100037668(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "accessoryBrowser"));
  objc_msgSend(v5, "stopSearchingForNewAccessoriesWithError:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  objc_msgSend(v6, "coordinatorRequestedDismissal:", WeakRetained);

}

BOOL sub_100037ACC(id a1, HSAccessoryTuple *a2)
{
  return !-[HSAccessoryTuple isSetupComplete](a2, "isSetupComplete");
}

id sub_100037E6C(id a1, HSAccessoryTuple *a2)
{
  return -[HSAccessoryTuple accessory](a2, "accessory");
}

void sub_1000380BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000380E0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pairAccessory");

}

BOOL sub_100038AD0(id a1, HMAccessory *a2)
{
  HMAccessory *v2;
  void *v3;
  unsigned int v4;

  v2 = a2;
  if (-[HMAccessory isBridged](v2, "isBridged"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory services](v2, "services"));
    v4 = objc_msgSend(v3, "na_any:", &stru_1000A29D0) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

BOOL sub_100038B34(id a1, HMService *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMService serviceType](a2, "serviceType"));
  v3 = objc_msgSend(v2, "isEqualToString:", HMServiceTypeValve);

  return v3;
}

void sub_10003923C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 168));
  _Unwind_Resume(a1);
}

void sub_100039288(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessorySetupCoordinator"));
  objc_msgSend(v5, "createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:completionHandler:", *(_QWORD *)(a1 + 32), v3);

}

id sub_100039308(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = objc_opt_class(HMSetupAccessoryPayload, v5);
  v7 = v3;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "showCustomCommissioningFlowAlertIfNecessaryForPayload:onViewController:", v9, *(_QWORD *)(a1 + 40)));
  }
  else
  {
    v12 = HFLogForCategory(58, v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupAccessoryDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "discoveredAccessory"));
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 136316162;
      v20 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]_block_invoke_2";
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Matter - Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, result:%@]", (uint8_t *)&v19, 0x34u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v14));

  }
  return v11;
}

id sub_1000394D0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_opt_class(HMSetupAccessoryPayload, v5);
  v7 = v3;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v11 = HFLogForCategory(58, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupAccessoryDescription"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "discoveredAccessory"));
      v16 = *(void **)(a1 + 32);
      v25 = 136316162;
      v26 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]_block_invoke";
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v15;
      v33 = 2112;
      v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Updating setupAccessoryDescription with payload - [ setupAccessoryDescription:%@, payload:%@, discoveredAccessory:%@, setupCode:%@ ]", (uint8_t *)&v25, 0x34u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupAccessoryDescription"));
    objc_msgSend(v17, "updateWithSetupAccessoryPayload:", v9);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pairingFuture"));
    objc_msgSend(v18, "updateSetupPayload:", v9);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupAccessoryDescription"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "discoveredAccessory"));
      v24 = *(void **)(a1 + 32);
      v25 = 136316162;
      v26 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]_block_invoke";
      v27 = 2112;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, result:%@]", (uint8_t *)&v25, 0x34u);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v20));

  }
  return v19;
}

NAFuture *sub_100039768(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "topAccessoryTuple"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "configuration"));
  objc_msgSend(v2, "setIsReadyToPair:", 1);

  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

void sub_100039E84(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessorySetupCoordinator"));
  objc_msgSend(v5, "createCHIPSetupPayloadStringForStagedPairingWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 32), v3);

}

id sub_100039F04(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19[2];
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v23 = v8;
    v24 = 2112;
    v25 = v3;
    v26 = 2112;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ retrieved setupPayloadString %@ from locker accessory %@", buf, 0x20u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "discoveredAccessory"));
  objc_msgSend(v10, "setRawSetupPayloadString:", v3);

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003A124;
  v20[3] = &unk_1000A29F8;
  v11 = v3;
  v21 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithCompletionHandlerAdapterBlock:](NAFuture, "futureWithCompletionHandlerAdapterBlock:", v20));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003A1A4;
  v17[3] = &unk_1000A2A70;
  objc_copyWeak(v19, (id *)buf);
  v13 = v11;
  v14 = *(void **)(a1 + 48);
  v18 = v13;
  v19[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flatMap:", v17));

  objc_destroyWeak(v19);
  objc_destroyWeak((id *)buf);

  return v15;
}

void sub_10003A0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003A124(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessorySetupCoordinator"));
  objc_msgSend(v5, "createSetupAccessoryPayloadWithSetupPayloadURLString:completionHandler:", *(_QWORD *)(a1 + 32), v3);

}

id sub_10003A1A4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSString *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_opt_class(HMSetupAccessoryPayload, v5);
  v7 = v3;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v11 = HFLogForCategory(58, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v15 = (char *)objc_claimAutoreleasedReturnValue(v14);
      v16 = *(void **)(a1 + 32);
      v25 = 138412802;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ createSetupAccessoryPayloadWithSetupPayloadURLString:completionHandler:, setupPayloadString %@, payload %@.", (uint8_t *)&v25, 0x20u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupAccessoryDescription"));
    objc_msgSend(v17, "updateWithSetupAccessoryPayload:", v9);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pairingFuture"));
    objc_msgSend(v18, "updateSetupPayload:", v9);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "setupAccessoryDescription"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "discoveredAccessory"));
      v24 = *(_QWORD *)(a1 + 32);
      v25 = 136316162;
      v26 = "-[HSProxCardCoordinator didReceiveDiscoveredAccessory:]_block_invoke_2";
      v27 = 2112;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Matter - Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupPayloadString:%@, result:%@]", (uint8_t *)&v25, 0x34u);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v20));

  }
  return v19;
}

id sub_10003A410(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  v5 = HFLogForCategory(58, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005FDEC(a1, (uint64_t)v3, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v3));
  return v7;
}

id sub_10003A708(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[16];

  if (!objc_msgSend(*(id *)(a1 + 32), "isUsingHAPCommunicationProtocol"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isUsingCHIPCommunicationProtocol") & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HSProxCardCoordinator.m"), 1227, CFSTR("Precondition not satisfied: self.isUsingCHIPCommunicationProtocol"));

    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "discoveredAccessory"));

    if (!v2)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10003A96C;
      v23[3] = &unk_1000A18B0;
      v8 = *(void **)(a1 + 40);
      v23[4] = *(_QWORD *)(a1 + 32);
      v24 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithCompletionHandlerAdapterBlock:](NAFuture, "futureWithCompletionHandlerAdapterBlock:", v23));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10003AA08;
      v20[3] = &unk_1000A2AE0;
      v10 = *(void **)(a1 + 40);
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = v10;
      v22 = *(id *)(a1 + 48);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v20));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10003AB00;
      v18[3] = &unk_1000A2B08;
      v12 = *(void **)(a1 + 40);
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v18));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10003AC4C;
      v16[3] = &unk_1000A2598;
      v14 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v14;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recover:", v16));

      return v6;
    }
    v4 = HFLogForCategory(58, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "We continue pairing within _discoveredAccessoryOrSetupCodeDidUpdateFromViewController", buf, 2u);
    }

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v6;
}

void sub_10003A96C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "discoveredAccessory"));
  objc_msgSend(v5, "setRawSetupPayloadString:", *(_QWORD *)(a1 + 40));

  v8 = (id)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessorySetupCoordinator"));
  objc_msgSend(v7, "createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

id sub_10003AA08(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;

  v3 = a2;
  v5 = objc_opt_class(HMSetupAccessoryPayload, v4);
  v6 = v3;
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "showCustomCommissioningFlowAlertIfNecessaryForPayload:onViewController:", v8, *(_QWORD *)(a1 + 48)));
  }
  else
  {
    v11 = HFLogForCategory(58, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10005FE94(a1, (uint64_t)v6, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 33));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v13));

  }
  return v10;
}

id sub_10003AB00(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryDescription"));
  objc_msgSend(v4, "updateWithSetupAccessoryPayload:", v3);

  v6 = HFLogForCategory(58, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "discoveredAccessory"));
    v10 = *(_QWORD *)(a1 + 40);
    v13 = 136316162;
    v14 = "-[HSProxCardCoordinator didReceiveSetupCode:fromViewController:]_block_invoke";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Updating setupAccessoryDescription with payload - [ setupAccessoryDescription:%@, payload:%@, discoveredAccessory:%@, setupCode:%@ ]", (uint8_t *)&v13, 0x34u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v11;
}

id sub_10003AC4C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = v4;
  if (v4 != (void *)HFErrorDomain)
  {

LABEL_7:
    v13 = HFLogForCategory(58, v6);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10005FF4C(a1, (uint64_t)v3, v14);

    v15 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryHostVCUnsupportedSetupPayloadAlertTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = HULocalizedString(CFSTR("HUProximityCardEnterSetupCodeErrorText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:title:description:](NSError, "hf_errorWithCode:title:description:", 62, v16, v18));

    objc_msgSend(*(id *)(a1 + 32), "setSetupCode:", 0);
    v3 = (id)v19;
    goto LABEL_10;
  }
  v7 = objc_msgSend(v3, "code");

  if (v7 != (id)96)
    goto LABEL_7;
  v8 = HFLogForCategory(58, v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "discoveredAccessory"));
    v12 = *(_QWORD *)(a1 + 40);
    v22 = 136315906;
    v23 = "-[HSProxCardCoordinator didReceiveSetupCode:fromViewController:]_block_invoke";
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Custom commission flow was canceled - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@]", (uint8_t *)&v22, 0x2Au);

  }
LABEL_10:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v3));

  return v20;
}

void sub_10003B000(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  v4 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCRequiresCustomCommissioningFlowAlertTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCRequiresCustomCommissioningFlowAlertMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1));

  v9 = HULocalizedString(CFSTR("HUCancelTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003B1E0;
  v20[3] = &unk_1000A14A0;
  v11 = v3;
  v21 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, v20));

  objc_msgSend(v8, "addAction:", v12);
  v13 = HULocalizedString(CFSTR("HUOkTitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003B278;
  v17[3] = &unk_1000A1478;
  v18 = v11;
  v19 = *(id *)(a1 + 32);
  v15 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v17));

  objc_msgSend(v8, "addAction:", v16);
  objc_msgSend(v8, "setPreferredAction:", v16);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v8, 1, 0);

}

void sub_10003B1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = HFLogForCategory(58, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Custom commission flow was canceled", v7, 2u);
  }

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 96));
  objc_msgSend(v5, "finishWithError:", v6);

}

id sub_10003B278(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = HFLogForCategory(58, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Custom commission flow will continue", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

void sub_10003B510(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x34u);
}

void sub_10003B724(id a1)
{
  HSAccessoryPairingEventLogger *v1;
  void *v2;

  v1 = objc_alloc_init(HSAccessoryPairingEventLogger);
  v2 = (void *)qword_1000C3560;
  qword_1000C3560 = (uint64_t)v1;

}

NSArray *__cdecl sub_10003C6DC(id a1, NSDictionary *a2)
{
  return -[NSDictionary allKeys](a2, "allKeys");
}

NSArray *__cdecl sub_10003C6E4(id a1, NSDictionary *a2)
{
  return -[NSDictionary allValues](a2, "allValues");
}

void sub_10003C9B8(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v16;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a2 < a3)
  {
    v20 = v11;
    v21 = v10;
    v22 = v9;
    v23 = v8;
    v24 = v7;
    v25 = v6;
    v26 = v5;
    v27 = v4;
    v28 = v12;
    v29 = v13;
    v16 = a2;
    do
    {
      v18 = *(void **)(a1 + 32);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v16, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29));
      objc_msgSend(v18, "addObject:", v19);

      v16 += a4;
    }
    while (v16 < a3);
  }
}

void sub_10003D360(id a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_100060084(v2);

}

id sub_10003D3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  v3 = HFLogForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ending background task (assuming host app is connected by now)", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "backgroundTaskIdentifier"));

  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundTaskIdentifier:", UIBackgroundTaskInvalid);
}

id sub_10003D910(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNetworkProtection:andFinishWithActionResult:", 1, 0);
}

id sub_10003D920(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNetworkProtection:andFinishWithActionResult:", 0, 2);
}

void sub_10003DB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003DB64(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hideActivityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v7[0] = HUConfigurationResultActionKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  v8[0] = v4;
  v7[1] = HUConfigurationResultCurrentViewControllerClassKey;
  v8[1] = objc_opt_class(WeakRetained, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  objc_msgSend(v3, "viewController:didFinishWithConfigurationResults:", WeakRetained, v6);

}

uint64_t sub_10003E06C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topAccessoryTuple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessory"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIdentifier"));
  v9 = objc_msgSend(v6, "isEqual:", v8) ^ 1;

  return v9;
}

HMAccessory *__cdecl sub_10003E1EC(id a1, HSAccessoryTuple *a2)
{
  return -[HSAccessoryTuple accessory](a2, "accessory");
}

void sub_10003E1F4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "updateAccessoriesPendingConfiguration:", v3);
  objc_msgSend(v4, "finishWithResult:", &off_1000A83C8);

}

void sub_10003EFAC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void sub_10003F25C(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (*(_QWORD *)(a1 + 40) == a3 && objc_msgSend(*(id *)(a1 + 32), "isFirstResponder"))
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tintColor")));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v7, "setBorderColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    v9 = v8;
    v10 = 2.0;
  }
  else
  {
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemLightMidGrayColor](UIColor, "systemLightMidGrayColor")));
    v12 = objc_msgSend(v11, "CGColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v13, "setBorderColor:", v12);

    v14 = 1.0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) <= 6uLL)
      v14 = *(double *)(a1 + 48) + 1.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    v9 = v8;
    v10 = v14;
  }
  objc_msgSend(v8, "setBorderWidth:", v10);

  if (*(_QWORD *)(a1 + 40) <= a3)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "label"));
    objc_msgSend(v15, "setText:", &stru_1000A3BA0);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "substringWithRange:", a3, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "label"));
    objc_msgSend(v16, "setText:", v15);

  }
}

id sub_100040AC4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAlertForBluetooth:Wifi:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

void sub_100040C4C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  if (v5)
  {
    v6 = HFLogForCategory(58);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000600C4();

  }
  else
  {
    if (a2 == 5)
      v8 = 2;
    else
      v8 = 1;
    objc_msgSend(*(id *)(a1 + 32), "setBluetoothInterfaceStatus:", v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100040D24(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a2;
  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100060134();

}

void sub_100041294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000412BC(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32))
    NSLog(CFSTR("Missing Bluetooth and WiFi alert title for bluetooth interface state: %d WiFi interface state: %d"), objc_msgSend(*(id *)(a1 + 40), "bluetoothInterfaceStatus"), objc_msgSend(*(id *)(a1 + 40), "_wiFiInterfaceStatus"));
  if (!*(_QWORD *)(a1 + 48))
    NSLog(CFSTR("Missing Bluetooth and WiFi alert description for bluetooth interface state: %d WiFi interface state: %d"), objc_msgSend(*(id *)(a1 + 40), "bluetoothInterfaceStatus"), objc_msgSend(*(id *)(a1 + 40), "_wiFiInterfaceStatus"));
}

void sub_10004133C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNetworkInterfacePowerState:", 1);

}

void sub_1000415B8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

id sub_100042468(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entitlementContext"));
  v3 = objc_msgSend(v2, "isEntitledForHomeKitSPI");

  if (v3)
    return (id)objc_opt_new(NSSet, v4);
  v6 = (void *)objc_opt_new(NSMutableSet, v4);
  v17 = HMAccessoryCategoryTypeAppleTV;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entitlementContext"));
  v9 = objc_msgSend(v8, "isEntitledForAll3rdPartyAccessoryTypes");

  if ((v9 & 1) == 0)
  {
    v16 = HMAccessoryCategoryTypeAirPort;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v6, "addObjectsFromArray:", v10);

    v15[0] = HMAccessoryCategoryTypeTelevision;
    v15[1] = HMAccessoryCategoryTypeTelevisionSetTopBox;
    v15[2] = HMAccessoryCategoryTypeTelevisionStreamingStick;
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
    objc_msgSend(v6, "addObjectsFromArray:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entitlementContext"));
    LOBYTE(v11) = objc_msgSend(v12, "isEntitledForThirdPartySetupAccessoryPayload");

    if ((v11 & 1) == 0)
    {
      v14[0] = HMAccessoryCategoryTypeSpeaker;
      v14[1] = HMAccessoryCategoryTypeAudioReceiver;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
      objc_msgSend(v6, "addObjectsFromArray:", v13);

      objc_msgSend(v6, "addObject:", HMAccessoryCategoryTypeWiFiRouter);
    }
  }
  return v6;
}

void sub_100042964(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leftBarButtonItem"));
  objc_msgSend(v3, "setTintColor:", v4);

}

void sub_1000429CC(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationItem"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leftBarButtonItem"));
  objc_msgSend(v1, "setEnabled:", 0);

}

void sub_100042A18(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationItem"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leftBarButtonItem"));
  objc_msgSend(v1, "setTintColor:", 0);

}

id sub_100043AD8()
{
  if (qword_1000C3570 != -1)
    dispatch_once(&qword_1000C3570, &stru_1000A2E48);
  return (id)qword_1000C3578;
}

void sub_100043B18(id a1)
{
  void *v1;

  v1 = (void *)qword_1000C3578;
  qword_1000C3578 = (uint64_t)&off_1000A8CF8;

}

BOOL sub_100043F68(id a1, HMService *a2)
{
  HMService *v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  HMService *v14;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMService serviceType](v2, "serviceType"));
  v4 = objc_msgSend(v3, "isEqualToString:", HMServiceTypeValve);

  if ((v4 & 1) == 0)
  {
    v5 = HFLogForCategory(58);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMService localizedDescription](v2, "localizedDescription"));
      v9 = 136315650;
      v10 = "+[HSPCNameZonesViewController applicableServicesForAccessory:]_block_invoke";
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s skipping %@ %@", (uint8_t *)&v9, 0x20u);

    }
  }

  return v4;
}

void sub_1000443E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004440C(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "sessionQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000444FC;
  v10[3] = &unk_1000A2E90;
  objc_copyWeak(&v14, a1 + 6);
  v11 = v6;
  v12 = a1[5];
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void sub_1000444FC(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[16];
  _QWORD block[4];
  id v30;
  id v31;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100060430(a1 + 32, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(WeakRetained, "setOverallSession:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000446F4;
    block[3] = &unk_1000A0F18;
    v30 = *(id *)(a1 + 40);
    v31 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v13 = v30;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NFC: Started session", buf, 2u);
    }

    objc_msgSend(WeakRetained, "setNearFieldReaderSession:", *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "nearFieldReaderSession"));
    objc_msgSend(v14, "setDelegate:", WeakRetained);

    v15 = *(void **)(a1 + 48);
    v27 = 0;
    v16 = objc_msgSend(v15, "startPollingWithError:", &v27);
    v13 = v27;
    if ((v16 & 1) == 0)
    {
      v17 = HFLogForCategory(58);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000603CC((uint64_t)v13, v18, v19, v20, v21, v22, v23, v24);

    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100044700;
    v25[3] = &unk_1000A10A8;
    v26 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v25);

  }
}

id sub_1000446F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

id sub_100044700(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void sub_10004492C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004495C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10004496C(uint64_t a1)
{

}

intptr_t sub_100044974(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100044988(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallSession"));
  objc_msgSend(v2, "endSession");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nearFieldReaderSession"));
  objc_msgSend(v3, "endSession");

  objc_msgSend(*(id *)(a1 + 32), "setOverallSession:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setNearFieldReaderSession:", 0);
  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NFC: Ended session", v8, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

id sub_100045E08(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAssociatedServiceType:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

id sub_100045E18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v3 = HFLogForCategory(58, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Succesfully set associated type %@ on %@", (uint8_t *)&v8, 0x16u);
  }

  return *(id *)(a1 + 48);
}

id sub_100045ED0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;

  v3 = a2;
  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10006052C(v3, v5);

  v6 = *(id *)(a1 + 32);
  return v6;
}

id sub_100046544(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v1));

  return v2;
}

id sub_10004659C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000605C0(a1, (uint64_t)v3, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
  objc_msgSend(v6, "handleError:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8578));
  return v7;
}

NAFuture *__cdecl sub_100046830(id a1, NSNull *a2)
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8590);
}

id sub_100046CF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc((Class)HURestrictedGuestAccessSettingsModule);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addedAccessory"));
  v9 = objc_msgSend(v7, "initWithItemUpdater:home:accessoryToAdd:", v5, v6, v8);

  v12 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return v10;
}

HUItemModuleController *__cdecl sub_100046DD4(id a1, HFItemModule *a2)
{
  HFItemModule *v2;
  uint64_t v3;
  uint64_t v4;
  HFItemModule *v5;
  HFItemModule *v6;
  HFItemModule *v7;
  HFItemModule *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v2 = a2;
  v4 = objc_opt_class(HURestrictedGuestAccessSettingsModule, v3);
  v5 = v2;
  v6 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class(v6, v11));

    }
  }
  else
  {
    v8 = 0;
  }

  v12 = objc_msgSend(objc_alloc((Class)HURestrictedGuestAccessSettingsModuleController), "initWithModule:", v8);
  return (HUItemModuleController *)v12;
}

id *sub_100047100(id *result, char a2)
{
  id *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    v3 = HFLogForCategory(58);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100060648(v4, v5, v6, v7, v8, v9, v10, v11);

    return (id *)objc_msgSend(v2[4], "dismissViewControllerAnimated:completion:", 0, 0);
  }
  return result;
}

void sub_100047264(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_time_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD block[4];
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v4, "timeIntervalSinceDate:", a1[4]);
  v6 = v5;

  v7 = HFLogForCategory(58);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:]_block_invoke";
    v30 = 2048;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s refresh took %f", buf, 0x16u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100047464;
  v26[3] = &unk_1000A2F90;
  v9 = (void *)a1[6];
  v26[4] = a1[5];
  v27 = v9;
  v10 = objc_retainBlock(v26);
  if (a2)
  {
    v11 = HFLogForCategory(58);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000606B8(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047598;
    block[3] = &unk_1000A2FB8;
    v25 = v10;
    dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);
    v21 = v25;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allHomesFuture"));
    v23 = objc_msgSend(v22, "addCompletionBlock:", v10);

  }
}

void sub_100047464(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = HFLogForCategory(58);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = "-[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:]_block_invoke";
      v12 = 1024;
      v13 = 121;
      v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s : %d fetched all homes after home graph refresh. Homes: %@", (uint8_t *)&v10, 0x1Cu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100060728((uint64_t)v6, v9);

    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  }

}

void sub_100047598(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allHomesFuture"));
  v3 = objc_msgSend(v2, "addCompletionBlock:", *(_QWORD *)(a1 + 32));

}

void sub_100047934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100047958(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  HSProxCardCoordinator *v19;
  void *v20;
  HSProxCardCoordinator *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100047E34;
  v37[3] = &unk_1000A3008;
  v37[4] = WeakRetained;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_firstObjectPassingTest:", v37));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessories"));
  if (objc_msgSend(WeakRetained, "launchReason") != (id)1)
  {
    if (objc_msgSend(WeakRetained, "launchReason") == (id)2)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_safetyAndSecuritySupportedAccessories"));
    }
    else if (objc_msgSend(WeakRetained, "launchReason") == (id)3)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_siriEndpointCapableAccessoriesToOnboard"));
    }
    else
    {
      if (objc_msgSend(WeakRetained, "launchReason") != (id)6)
      {
        if (objc_msgSend(WeakRetained, "launchReason") == (id)4 || objc_msgSend(WeakRetained, "launchReason") == (id)5)
        {
          v29 = (void *)objc_opt_new(NSMutableSet, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_accessoriesSupportingAccessCodes"));
          objc_msgSend(v29, "na_safeAddObjectsFromArray:", v30);

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_walletKeyAccessories"));
          objc_msgSend(v29, "na_safeAddObjectsFromArray:", v31);

          v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFUtilities sortedLockAccessoryArrayForSetup:](HFUtilities, "sortedLockAccessoryArrayForSetup:", v29));
        }
        else
        {
          v8 = 0;
        }
        goto LABEL_13;
      }
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_accessoriesSupportingAccessCodes"));
    }
    v8 = (void *)v14;
    goto LABEL_13;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_filter:", &stru_1000A3028));
  if (!objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HUHomeUIServiceLaunchAccessoryUUIDsArray));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100047FD0;
    v35[3] = &unk_1000A1810;
    v36 = v9;
    v32 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_filter:", v35));
    v11 = HFLogForCategory(58);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_prettyDescription"));
      *(_DWORD *)buf = 136315394;
      v39 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke_2";
      v40 = 2112;
      v41 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s We received the accessoriesFromPayload but their pendingConfigurationIdentifier are nil. This is most likely due to HomeKit accessoryDidUpdatePendingConfigurationIdentifier: callback delay to Home app. We know it because HomeUIService has the latest home graph. The Home app banner should dismiss in a few seconds. No accessories to resume setup with. %@", buf, 0x16u);

    }
  }
LABEL_13:
  v15 = HFLogForCategory(58);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 136316162;
    v39 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke";
    v40 = 2112;
    v41 = v6;
    v42 = 2112;
    v43 = v17;
    v44 = 2112;
    v45 = v8;
    v46 = 2048;
    v47 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(%s) home %@ userInfo %@ accessoriesToResumeSetup %@ count %ld", buf, 0x34u);
  }

  objc_msgSend(WeakRetained, "setAccessoriesToResumeSetup:", v8);
  if (objc_msgSend(v8, "count"))
  {
    v19 = [HSProxCardCoordinator alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "accessoriesToResumeSetup"));
    v21 = -[HSProxCardCoordinator initWithHome:accessories:delegate:](v19, "initWithHome:accessories:delegate:", v6, v20, WeakRetained);
    objc_msgSend(WeakRetained, "setCoordinator:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "coordinator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nextViewController"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10004802C;
    v33[3] = &unk_1000A3050;
    objc_copyWeak(&v34, v4);
    v24 = objc_msgSend(v23, "addSuccessBlock:", v33);

    objc_destroyWeak(&v34);
  }
  else
  {
    v25 = HFLogForCategory(58);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_100060830(a1, v26, v27);

    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void sub_100047E18(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100047E34(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uniqueIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "resumeSetupHomeUUIDString"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

BOOL sub_100047EA4(id a1, HMAccessory *a2)
{
  HMAccessory *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory name](v2, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory pendingConfigurationIdentifier](v2, "pendingConfigurationIdentifier"));
  v5 = HFLogForCategory(58);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory hf_prettyDescription](v2, "hf_prettyDescription"));
    v10 = 136315906;
    v11 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke_3";
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s name %@ pendingConfigurationIdentifier %@ accessory %@", (uint8_t *)&v10, 0x2Au);

  }
  v8 = objc_msgSend(v4, "length") != 0;

  return v8;
}

id sub_100047FD0(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uniqueIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

void sub_10004802C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_presentProxCardFlowWithInitialViewController:", v3);

}

void sub_1000486D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100048704(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000487A8;
  v5[3] = &unk_1000A30A0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_1000487A8(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "proxNavigationController"));
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

void sub_100048B40(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "proxNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentViewController"));
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

void sub_100048D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100048D80(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100048E24;
  v5[3] = &unk_1000A30A0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100048E24(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "proxNavigationController"));
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

id sub_100048EAC(id a1, HMHome *a2)
{
  HMHome *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome name](v2, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uuid](v2, "uuid"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[name %@ uuid %@]"), v3, v4));
  return v5;
}

void sub_100049254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100049278(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000493F8;
  v11[3] = &unk_1000A3008;
  v12 = *(id *)(a1 + 32);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_firstObjectPassingTest:", v11));
  v6 = (void *)v5;
  if (!*(_QWORD *)(a1 + 32) || v5)
  {
    objc_msgSend(WeakRetained, "_initiateSetupFlow:", v5);
  }
  else
  {
    v7 = HFLogForCategory(58);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_allHomesDescription:", v3));
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "We cannot find our home for the given homeUUID. homeUUID %@ not found in homes %@.", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);
  }

}

id sub_1000493F8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100049720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004974C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "coordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeTuple"));
  v7 = objc_msgSend(v6, "currentStep");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryPayload"));
  if (v8)
  {
    if (v7 == (id)5)
      goto LABEL_16;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", v7));
    NSLog(CFSTR("currentStep should be %@, but it is %@"), v9, v10);

    goto LABEL_15;
  }
  if (!objc_msgSend(WeakRetained, "isLaunchedToSetupASpecificAccessory"))
  {
    if (v7 != (id)1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", v7));
      NSLog(CFSTR("currentStep should be %@, but it is %@"), v15, v16);

    }
    v17 = objc_opt_class(HSPCCameraScanViewController, v11);
    v18 = v3;
    if ((objc_opt_isKindOfClass(v18, v17) & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v9 = v19;

    objc_msgSend(v9, "setMode:", 1);
LABEL_15:

    goto LABEL_16;
  }
  if (v7 != (id)4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", v7));
    NSLog(CFSTR("currentStep should be %@, but it is %@"), v12, v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryUUID"));

  if (!v14)
    NSLog(CFSTR("Asked to pair with an accessory, but we don't have a UUID in the setup description: %@"), *(_QWORD *)(a1 + 32));
LABEL_16:
  v20 = HFLogForCategory(58);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (objc_class *)objc_opt_class(WeakRetained, v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", v7));
    *(_DWORD *)buf = 138412802;
    v28 = v25;
    v29 = 2112;
    v30 = v26;
    v31 = 2048;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Launching %@ with initial view controller %@, %ld", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "_presentProxCardFlowWithInitialViewController:", v3);

}

void sub_100049D74(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "proxNavigationController"));
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

void sub_10004A580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004A5A4(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cleanup");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

void sub_10004A998(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  objc_msgSend((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy")), "invalidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sharingFrameworkClient"));
  objc_msgSend(v2, "invalidate");

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HSProximityCardHostViewController _cleanup]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: SBUIRemoteAlertHostInterface & SFClient invalidated, will exit(0) the process", (uint8_t *)&v5, 0xCu);
  }

  exit(0);
}

void sub_10004AA48(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = HFLogForCategory(58);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100060B34((uint64_t)v3, a1, v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id sub_10004AD54(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "popupType");
}

void sub_10004C750(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifyButton"));
  objc_msgSend(v4, "setHighlighted:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifyButton"));
  objc_msgSend(v5, "setHidden:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "spinner"));
  objc_msgSend(v6, "stopAnimating");

  v7 = HFLogForCategory(58);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100060BF8(a1, (uint64_t)v3, v9);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Succesfully identified %@", (uint8_t *)&v11, 0xCu);
  }

}

id sub_10004C8E4()
{
  if (qword_1000C3580 != -1)
    dispatch_once(&qword_1000C3580, &stru_1000A3130);
  return (id)qword_1000C3588;
}

void sub_10004C924(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[56];
  _QWORD v4[56];

  v3[0] = &off_1000A85C0;
  v3[1] = &off_1000A85D8;
  v4[0] = CFSTR("CannotDecodeFromString");
  v4[1] = CFSTR("NotReady");
  v3[2] = &off_1000A85F0;
  v3[3] = &off_1000A8608;
  v4[2] = CFSTR("CameraScan");
  v4[3] = CFSTR("DiscoveredAccessories");
  v3[4] = &off_1000A8620;
  v3[5] = &off_1000A8638;
  v4[4] = CFSTR("TroubleshootingTips");
  v4[5] = CFSTR("EnterSetupCode");
  v3[6] = &off_1000A8650;
  v3[7] = &off_1000A8668;
  v4[6] = CFSTR("Detected");
  v4[7] = CFSTR("SelectHome");
  v3[8] = &off_1000A8680;
  v3[9] = &off_1000A8698;
  v4[8] = CFSTR("CreateHome");
  v4[9] = CFSTR("HomeHubUpgradeRequired");
  v3[10] = &off_1000A86B0;
  v3[11] = &off_1000A86C8;
  v4[10] = CFSTR("HomeHubRequired");
  v4[11] = CFSTR("Pairing");
  v3[12] = &off_1000A86E0;
  v3[13] = &off_1000A86F8;
  v4[12] = CFSTR("ThreadRouterWarning");
  v4[13] = CFSTR("ResumeSelectAccessory");
  v3[14] = &off_1000A8710;
  v3[15] = &off_1000A8728;
  v4[14] = CFSTR("ResumeWelcome");
  v4[15] = CFSTR("SelectRoom");
  v3[16] = &off_1000A8740;
  v3[17] = &off_1000A8758;
  v4[16] = CFSTR("CreateRoom");
  v4[17] = CFSTR("NameAccessory");
  v3[18] = &off_1000A8770;
  v3[19] = &off_1000A8788;
  v4[18] = CFSTR("LockAccessUpdate");
  v4[19] = CFSTR("WalletKey");
  v3[20] = &off_1000A87A0;
  v3[21] = &off_1000A87B8;
  v4[20] = CFSTR("WalletKeyUWB");
  v4[21] = CFSTR("WalletKeyExpressMode");
  v3[22] = &off_1000A87D0;
  v3[23] = &off_1000A87E8;
  v4[22] = CFSTR("PINCode");
  v4[23] = CFSTR("PINCodeTextField");
  v3[24] = &off_1000A8800;
  v3[25] = &off_1000A8818;
  v4[24] = CFSTR("GuestAccess");
  v4[25] = CFSTR("SelectAssociatedType");
  v3[26] = &off_1000A8830;
  v3[27] = &off_1000A8848;
  v4[26] = CFSTR("ConfigureCamera");
  v4[27] = CFSTR("ConfigureCameraAccess");
  v3[28] = &off_1000A8860;
  v3[29] = &off_1000A8878;
  v4[28] = CFSTR("FaceRecognition");
  v4[29] = CFSTR("FaceRecognitionPhotoLibraryAccess");
  v3[30] = &off_1000A8890;
  v3[31] = &off_1000A88A8;
  v4[30] = CFSTR("Chime");
  v4[31] = CFSTR("NameInputSources");
  v3[32] = &off_1000A88C0;
  v3[33] = &off_1000A88D8;
  v4[32] = CFSTR("NameShowerHeads");
  v4[33] = CFSTR("NameZones");
  v3[34] = &off_1000A88F0;
  v3[35] = &off_1000A8908;
  v4[34] = CFSTR("NameServices");
  v4[35] = CFSTR("Recommendations");
  v3[36] = &off_1000A8920;
  v3[37] = &off_1000A8938;
  v4[36] = CFSTR("RestrictedGuestAccess");
  v4[37] = CFSTR("SafetyAndSecurity");
  v3[38] = &off_1000A8950;
  v3[39] = &off_1000A8968;
  v4[38] = CFSTR("UseSiri");
  v4[39] = CFSTR("UseSiriMultipleAccessory");
  v3[40] = &off_1000A8980;
  v3[41] = &off_1000A8998;
  v4[40] = CFSTR("SiriLanguageSelection");
  v4[41] = CFSTR("SiriVoiceSelection");
  v3[42] = &off_1000A89B0;
  v3[43] = &off_1000A89C8;
  v4[42] = CFSTR("SiriUpdateRequired");
  v4[43] = CFSTR("SiriVoiceRecognition");
  v3[44] = &off_1000A89E0;
  v3[45] = &off_1000A89F8;
  v4[44] = CFSTR("SetupSiri");
  v4[45] = CFSTR("SiriVoiceTraining");
  v3[46] = &off_1000A8A10;
  v3[47] = &off_1000A8A28;
  v4[46] = CFSTR("PersonalRequests");
  v4[47] = CFSTR("SiriForEveryone");
  v3[48] = &off_1000A8A40;
  v3[49] = &off_1000A8A58;
  v4[48] = CFSTR("UseAirPlay");
  v4[49] = CFSTR("BridgeAdded");
  v3[50] = &off_1000A8A70;
  v3[51] = &off_1000A8A88;
  v4[50] = CFSTR("SetupBridgedAccessories");
  v4[51] = CFSTR("RouterSetup");
  v3[52] = &off_1000A8AA0;
  v3[53] = &off_1000A8AB8;
  v4[52] = CFSTR("AccessoryUpdate");
  v4[53] = CFSTR("Done");
  v3[54] = &off_1000A8AD0;
  v3[55] = &off_1000A8AE8;
  v4[54] = CFSTR("Error");
  v4[55] = CFSTR("DismissSetup");
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 56));
  v2 = (void *)qword_1000C3588;
  qword_1000C3588 = v1;

}

void sub_10004CED0(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = objc_alloc((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stepToStringMap"));
  v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stepToStringMap"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004CFB0;
  v9[3] = &unk_1000A3158;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = objc_msgSend(v8, "copy");
  v7 = (void *)qword_1000C3590;
  qword_1000C3590 = (uint64_t)v6;

}

id sub_10004CFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

id sub_10004D17C()
{
  if (qword_1000C35A0 != -1)
    dispatch_once(&qword_1000C35A0, &stru_1000A3198);
  return (id)qword_1000C35A8;
}

void sub_10004D1BC(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[51];
  _QWORD v55[51];

  v54[0] = &off_1000A85F0;
  v55[0] = objc_opt_class(HSPCCameraScanViewController, v1);
  v54[1] = &off_1000A8608;
  v55[1] = objc_opt_class(HSPCDiscoveredAccessoryPickerViewController, v2);
  v54[2] = &off_1000A8620;
  v55[2] = objc_opt_class(HSPCTroubleshootingTipsViewController, v3);
  v54[3] = &off_1000A8638;
  v55[3] = objc_opt_class(HSPCEnterCodeViewController, v4);
  v54[4] = &off_1000A8650;
  v55[4] = objc_opt_class(HSPCDetectedViewController, v5);
  v54[5] = &off_1000A8668;
  v55[5] = objc_opt_class(HSPCSelectHomeViewController, v6);
  v54[6] = &off_1000A8680;
  v55[6] = objc_opt_class(HSPCCreateHomeViewController, v7);
  v54[7] = &off_1000A8698;
  v55[7] = objc_opt_class(HSPCHomeHubUpgradeRequiredViewController, v8);
  v54[8] = &off_1000A86B0;
  v55[8] = objc_opt_class(HSPCHomeHubRequiredViewController, v9);
  v54[9] = &off_1000A86E0;
  v55[9] = objc_opt_class(HSPCThreadRouterWarningViewController, v10);
  v54[10] = &off_1000A86C8;
  v55[10] = objc_opt_class(HSPCPairingViewController, v11);
  v54[11] = &off_1000A86F8;
  v55[11] = objc_opt_class(HSPCResumeSelectAccessoryViewController, v12);
  v54[12] = &off_1000A8710;
  v55[12] = objc_opt_class(HSPCResumeWelcomeViewController, v13);
  v54[13] = &off_1000A8728;
  v55[13] = objc_opt_class(HSPCSelectRoomViewController, v14);
  v54[14] = &off_1000A8740;
  v55[14] = objc_opt_class(HSPCCreateRoomViewController, v15);
  v54[15] = &off_1000A8758;
  v55[15] = objc_opt_class(HSPCNameAccessoryViewController, v16);
  v54[16] = &off_1000A8770;
  v55[16] = objc_opt_class(HSPCLockAccessUpdateViewController, v17);
  v54[17] = &off_1000A8788;
  v55[17] = objc_opt_class(HSPCWalletKeyViewController, v18);
  v54[18] = &off_1000A87A0;
  v55[18] = objc_opt_class(HSPCWalletKeyUWBViewController, v19);
  v54[19] = &off_1000A87B8;
  v55[19] = objc_opt_class(HSPCWalletKeyExpressModeViewController, v20);
  v54[20] = &off_1000A87D0;
  v55[20] = objc_opt_class(HSPCPINCodeViewController, v21);
  v54[21] = &off_1000A87E8;
  v55[21] = objc_opt_class(HSPCPINCodeTextFieldViewController, v22);
  v54[22] = &off_1000A8800;
  v55[22] = objc_opt_class(HSPCGuestAccessViewController, v23);
  v54[23] = &off_1000A8818;
  v55[23] = objc_opt_class(HSPCAssociatedTypeSelectionViewController, v24);
  v54[24] = &off_1000A8830;
  v55[24] = objc_opt_class(HSPCCameraSetupViewController, v25);
  v54[25] = &off_1000A8848;
  v55[25] = objc_opt_class(HSPCCameraUserAccessViewController, v26);
  v54[26] = &off_1000A8860;
  v55[26] = objc_opt_class(HSPCFaceRecognitionViewController, v27);
  v54[27] = &off_1000A8878;
  v55[27] = objc_opt_class(HSPCFaceRecognitionPhotoLibraryAccessViewController, v28);
  v54[28] = &off_1000A8890;
  v55[28] = objc_opt_class(HSPCChimeViewController, v29);
  v54[29] = &off_1000A88A8;
  v55[29] = objc_opt_class(HSPCNameInputSourcesViewController, v30);
  v54[30] = &off_1000A88C0;
  v55[30] = objc_opt_class(HSPCNameShowerHeadsViewController, v31);
  v54[31] = &off_1000A88D8;
  v55[31] = objc_opt_class(HSPCNameZonesViewController, v32);
  v54[32] = &off_1000A88F0;
  v55[32] = objc_opt_class(HSPCNameServicesViewController, v33);
  v54[33] = &off_1000A8908;
  v55[33] = objc_opt_class(HSPCSuggestedAutomationWrappingViewController, v34);
  v54[34] = &off_1000A8920;
  v55[34] = objc_opt_class(HSPCRestrictedGuestAccessViewController, v35);
  v54[35] = &off_1000A8938;
  v55[35] = objc_opt_class(HSPCSafetyAndSecurityViewController, v36);
  v54[36] = &off_1000A8950;
  v55[36] = objc_opt_class(HSPCUseSiriViewController, v37);
  v54[37] = &off_1000A8968;
  v55[37] = objc_opt_class(HSPCUseSiriMultipleAccessoryViewController, v38);
  v54[38] = &off_1000A8980;
  v55[38] = objc_opt_class(HSPCSelectSiriRecognitionLanguageViewController, v39);
  v54[39] = &off_1000A8998;
  v55[39] = objc_opt_class(HSPCSiriVoiceSelectionController, v40);
  v54[40] = &off_1000A89B0;
  v55[40] = objc_opt_class(HSPCSiriUpdateRequiredViewController, v41);
  v54[41] = &off_1000A89C8;
  v55[41] = objc_opt_class(HSPCSiriVoiceRecognitionViewController, v42);
  v54[42] = &off_1000A89E0;
  v55[42] = objc_opt_class(HSPCSiriSetupViewController, v43);
  v54[43] = &off_1000A89F8;
  v55[43] = objc_opt_class(HSPCSiriVoiceTrainingViewController, v44);
  v54[44] = &off_1000A8A10;
  v55[44] = objc_opt_class(HSPCPersonalRequestsViewController, v45);
  v54[45] = &off_1000A8A28;
  v55[45] = objc_opt_class(HSPCSiriForEveryoneViewController, v46);
  v54[46] = &off_1000A8A40;
  v55[46] = objc_opt_class(HSPCUseAirPlayViewController, v47);
  v54[47] = &off_1000A8A58;
  v55[47] = objc_opt_class(HSPCDoneViewController, v48);
  v54[48] = &off_1000A8AA0;
  v55[48] = objc_opt_class(HSPCAccessoryUpdateViewController, v49);
  v54[49] = &off_1000A8AB8;
  v55[49] = objc_opt_class(HSPCDoneViewController, v50);
  v54[50] = &off_1000A8AD0;
  v55[50] = objc_opt_class(HSPCErrorViewController, v51);
  v52 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 51));
  v53 = (void *)qword_1000C35A8;
  qword_1000C35A8 = v52;

}

id sub_10004DAE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004DB6C;
  v8[3] = &unk_1000A31C0;
  v9 = v3;
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", v8));

  return v6;
}

id sub_10004DB6C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_characteristicOfType:", *(_QWORD *)(a1 + 32));
}

NAFuture *__cdecl sub_10004DB78(id a1, HFCharacteristicBatchReadResponse *a2)
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

void sub_10004E014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10004E038(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
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

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addedAccessory"));

  v5 = objc_msgSend((id)objc_opt_class(WeakRetained, v4), "applicableServicesForAccessory:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_enabledServicesSetFromServices:", v6));
  v8 = objc_msgSend(v7, "mutableCopy");
  objc_msgSend(WeakRetained, "setEnabledServices:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_frozenServicesFromServices:", v6));
  objc_msgSend(WeakRetained, "setFrozenServices:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "serviceComparator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingComparator:", v11));
  objc_msgSend(WeakRetained, "setServices:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "services"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "suggestedNamesForServices:", v13));
  objc_msgSend(WeakRetained, "setServiceNames:", v14);

  objc_msgSend(WeakRetained, "_logDetailedServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));

  return v15;
}

id sub_10004E4B0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "services"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceNames"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupStateMachineConfiguration configureServices:withNames:](HSSetupStateMachineConfiguration, "configureServices:withNames:", v2, v3));

  return v4;
}

id sub_10004E520(uint64_t a1)
{
  return +[HSSetupStateMachineConfiguration disableServices:](HSSetupStateMachineConfiguration, "disableServices:", *(_QWORD *)(a1 + 32));
}

id sub_10004E534(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enabledServices"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupStateMachineConfiguration enableServices:](HSSetupStateMachineConfiguration, "enableServices:", v1));

  return v2;
}

uint64_t sub_10004F550(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "serviceType"));
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

id sub_10004F5F8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldServiceStartEnabled:", a2);
}

id sub_10004F668(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldServiceBeFrozen:", a2);
}

id sub_10004F724(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_givenNameForService:", a2));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[HFUtilities sanitizeAutoGeneratedHomeKitName:](HFUtilities, "sanitizeAutoGeneratedHomeKitName:", v3));
  v5 = v4;
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4))
  {
    v6 = 2;
    v7 = v4;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %ld"), v4, v6));

      ++v6;
      v7 = v5;
    }
    while ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5) & 1) != 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  return v5;
}

void sub_1000501A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100050250;
  v8[3] = &unk_1000A23C8;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "updateAudioAnalysisClassifierOptions:completion:", 1, v8);

}

void sub_100050250(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v3 = a2;
  v4 = HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100060D30((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Success in setting audio analysis classifier options setting", v17, 2u);
    }

    v13 = *(void **)(a1 + 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "config"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "home"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "audioAnalysisClassifierOptions")));
    objc_msgSend(v13, "finishWithResult:error:", v16, 0);

  }
}

void sub_100050364(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000503E4;
  v6[3] = &unk_1000A1C28;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "updateAudioAnalysisUserDropinAccessLevel:completionHandler:", 2, v6);

}

void sub_1000503E4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  v4 = HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100060D94((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Success in setting dropin access level setting", v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void sub_10005067C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050728;
  v7[3] = &unk_1000A1C28;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "updateDidOnboardAudioAnalysis:completion:", 1, v7);

}

void sub_100050728(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  v4 = HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100060DF8((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Success in setting audio analysis onboarding key", v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

NSArray *__cdecl sub_100050980(id a1, HMHome *a2, HFItemUpdating *a3)
{
  HFItemUpdating *v4;
  HMHome *v5;
  id v6;
  void *v7;
  id v9;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(objc_alloc((Class)HUCameraPermissionsSettingsModule), "initWithItemUpdater:home:displayStyle:", v4, v5, 1);

  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return (NSArray *)v7;
}

HUItemModuleController *__cdecl sub_100050A3C(id a1, HFItemModule *a2)
{
  HFItemModule *v2;
  id v3;

  v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)HUCameraSettingsModuleController), "initWithModule:", v2);

  objc_msgSend(v3, "setUseProxSetupPresentationStyle:", 1);
  return (HUItemModuleController *)v3;
}

void sub_100050F64(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const char *v24;

  v3 = a2;
  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[HSPCAccessoryUpdateViewController displayAutomaticUpdatesAlert]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Displaying popup to enable automatic software updates for third party accessories", buf, 0xCu);
  }

  v6 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryAutomaticUpdatesTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryAutomaticUpdatesMessage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1));

  v11 = HULocalizedString(CFSTR("HUTurnOnAutomaticUpdatesTitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000511C0;
  v21[3] = &unk_1000A1478;
  v21[4] = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v22 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, v21));

  objc_msgSend(v10, "addAction:", v14);
  v15 = HULocalizedString(CFSTR("HUNotNowTitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000512B8;
  v19[3] = &unk_1000A14A0;
  v20 = v13;
  v17 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v19));
  objc_msgSend(v10, "addAction:", v18);

  objc_msgSend(v10, "setPreferredAction:", v14);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v10, 1, 0);

}

id sub_1000511C0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  int v8;
  const char *v9;

  v2 = HFLogForCategory(58);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[HSPCAccessoryUpdateViewController displayAutomaticUpdatesAlert]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Enabling automatic software updates for third party accessories", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v6 = objc_msgSend(v5, "hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", &off_1000A8B48);
}

id sub_1000512B8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = HFLogForCategory(58);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HSPCAccessoryUpdateViewController displayAutomaticUpdatesAlert]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s User declined enabling software updates for third party accessories", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A8B48);
}

void sub_100051C74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "onboardingSelections"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100051D20;
  v8[3] = &unk_1000A15D0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "applyOnboardingSelections:completionHandler:", v6, v8);

}

void sub_100051D20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v5 = a2;
  if (v5)
  {
    v6 = HFLogForCategory(60);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005DE70((uint64_t)v5, v7);

  }
  v8 = HFLogForCategory(60);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = HMSiriEndpointOnboardingResultAsString(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Call succeeded with following result: %@", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

void sub_100052B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100052B74(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "copy");

  objc_msgSend(WeakRetained, "setItems:", v4);
  objc_msgSend(WeakRetained, "setLoaded:", 1);

}

id sub_100052E7C(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = objc_msgSend(objc_alloc((Class)HFDiscoveredAccessoryItemProvider), "initWithAccessoryBrowsingManager:", *(_QWORD *)(a1 + 32));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100052F58;
  v5[3] = &unk_1000A3350;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setFilter:", v5);
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v3;
}

uint64_t sub_100052F58(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (v2)
    return (uint64_t)objc_msgSend(v2, "shouldShowAccessory:", a2);
  else
    return 1;
}

BOOL sub_100053210(id a1, HFItem *a2)
{
  HFItem *v2;
  uint64_t v3;
  uint64_t v4;
  HFItem *v5;
  HFItem *v6;
  HFItem *v7;
  HFItem *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v2 = a2;
  v4 = objc_opt_class(HFDiscoveredAccessoryItem, v3);
  v5 = v2;
  v6 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class(v6, v11));

    }
  }
  else
  {
    v8 = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HFItem discoveredAccessory](v8, "discoveredAccessory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessory"));
  v14 = objc_msgSend(v13, "knownToSystemCommissioner") ^ 1;

  return v14;
}

int64_t sub_100053338(id a1, HFItem *a2, HFItem *a3)
{
  HFItem *v4;
  HFItem *v5;
  uint64_t v6;
  uint64_t v7;
  HFItem *v8;
  HFItem *v9;
  HFItem *v10;
  HFItem *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  HFItem *v17;
  HFItem *v18;
  HFItem *v19;
  HFItem *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned __int8 v32;
  int64_t v33;
  void *v34;
  void *v35;
  uint64_t (**v36)(_QWORD, _QWORD, _QWORD);

  v4 = a2;
  v5 = a3;
  v7 = objc_opt_class(HFDiscoveredAccessoryItem, v6);
  v8 = v4;
  v9 = v8;
  if (v8)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;
    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class(v9, v14));

    }
  }
  else
  {
    v11 = 0;
  }

  v16 = objc_opt_class(HFDiscoveredAccessoryItem, v15);
  v17 = v5;
  v18 = v17;
  if (v17)
  {
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;
    if (!v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v16, objc_opt_class(v18, v23));

    }
  }
  else
  {
    v20 = 0;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HFItem discoveredAccessory](v11, "discoveredAccessory"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HFItem discoveredAccessory](v20, "discoveredAccessory"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accessory"));
  if (objc_msgSend(v26, "knownToSystemCommissioner"))
  {

  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accessory"));
    v28 = objc_msgSend(v27, "knownToSystemCommissioner");

    if (!v28)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "discoveryDate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "discoveryDate"));
      v33 = (int64_t)objc_msgSend(v34, "compare:", v35);

      if (v33)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accessory"));
  v30 = objc_msgSend(v29, "knownToSystemCommissioner");

  if (!v30)
  {
    v33 = -1;
    goto LABEL_24;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accessory"));
  v32 = objc_msgSend(v31, "knownToSystemCommissioner");

  if ((v32 & 1) != 0)
  {
LABEL_23:
    v36 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(+[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator"));
    v33 = ((uint64_t (**)(_QWORD, HFItem *, HFItem *))v36)[2](v36, v9, v18);

    goto LABEL_24;
  }
  v33 = 1;
LABEL_24:

  return v33;
}

BOOL sub_10005370C(id a1, HFItemProvider *a2)
{
  HFItemProvider *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = a2;
  v4 = objc_opt_class(HFDiscoveredAccessoryItemProvider, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

NSArray *__cdecl sub_100053934(id a1, HMHome *a2, HFItemUpdating *a3)
{
  HFItemUpdating *v4;
  HMHome *v5;
  id v6;
  void *v7;
  id v9;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(objc_alloc((Class)HUFaceRecognitionUserPhotosLibrarySettingsModule), "initWithItemUpdater:home:", v4, v5);

  objc_msgSend(v6, "setShouldUseProxCardPresentationStyle:", 1);
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return (NSArray *)v7;
}

id sub_1000539F8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v5 = objc_opt_class(HUFaceRecognitionUserPhotosLibrarySettingsModule, v4);
  v6 = v3;
  v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class(v7, v12));

    }
  }
  else
  {
    v9 = 0;
  }

  v13 = objc_msgSend(objc_alloc((Class)HUFaceRecognitionUserPhotosLibrarySettingsModuleController), "initWithModule:host:", v9, *(_QWORD *)(a1 + 32));
  return v13;
}

id sub_100054040(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uniqueIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "suggestedRoomUUID"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

id sub_100054594(id a1, HMRoom *a2)
{
  return -[HMRoom name](a2, "name");
}

uint64_t sub_10005459C(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void sub_10005490C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100054930(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extensionMessenger"));
  objc_msgSend(v5, "fetchRoomsInHome:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

id sub_10005498C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1000A3508));
  objc_msgSend(WeakRetained, "setItems:", v5);

  objc_msgSend(WeakRetained, "setLoaded:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v3));

  return v6;
}

int64_t sub_100054A1C(id a1, MTSDeviceSetupRoom *a2, MTSDeviceSetupRoom *a3)
{
  MTSDeviceSetupRoom *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSDeviceSetupRoom name](a2, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSDeviceSetupRoom name](v4, "name"));

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return (int64_t)v7;
}

void sub_1000556A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak((id *)(v11 - 216));
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

void sub_100055708(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7[2];

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000557B4;
  block[3] = &unk_1000A3530;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v6 = v3;
  v7[1] = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v7);
}

void sub_1000557B4(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(*(id *)(a1 + 32), "CGImage"), 0, *(double *)(a1 + 48)));
  objc_msgSend(WeakRetained[8], "setImage:", v2);

}

id sub_100055830(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = HFLogForCategory(66);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v3, "BOOLValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_prettyDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_minimumDescription"));
    *(_DWORD *)buf = 136315906;
    v28 = "-[HSPCWalletKeyViewController initWithCoordinator:config:]_block_invoke_3";
    v29 = 1024;
    v30 = v7;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) hasWalletKeyNum = %{BOOL}d for current user %@ of home %@", buf, 0x26u);

  }
  v13 = objc_msgSend(v3, "BOOLValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "home"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
  if (v13)
    v22 = CFSTR("HSProximityCardWalletKeySubitle_RestrictedGuest");
  else
    v22 = CFSTR("HSProximityCardWalletKeySubitle");
  v23 = sub_1000594F0(v22, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(WeakRetained, "setSubtitle:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v25;
}

void sub_100055A24(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100055AB4;
  v2[3] = &unk_1000A30A0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

  objc_destroyWeak(&v4);
}

void sub_100055AB4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = HUImageNamed(CFSTR("WalletKeyInWalletApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "walletAppIconImageView"));
  objc_msgSend(v4, "setHidden:", 1);

}

void sub_100055B28(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_walletKeyColorToDisplay"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100055C38;
  v8[3] = &unk_1000A35A8;
  objc_copyWeak(&v12, a1 + 7);
  v6 = v3;
  v9 = v6;
  v11 = a1[6];
  v10 = a1[5];
  v7 = objc_msgSend(v5, "addCompletionBlock:", v8);

  objc_destroyWeak(&v12);
}

void sub_100055C24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100055C38(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(v4, "integerValue");

  v7 = objc_alloc((Class)PKSerializedDataAccessor);
  v8 = *(_QWORD *)(a1 + 32);
  v19 = 0;
  v9 = objc_msgSend(v7, "initWithData:error:", v8, &v19);
  v10 = v19;
  v11 = +[PKPass createWithValidatedFileDataAccessor:](PKPass, "createWithValidatedFileDataAccessor:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "paymentPass"));

  if (v10 || !v12)
  {
    v13 = HFLogForCategory(66);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100060F04();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v12, "setHomeKeyLiveRenderType:", +[HFWalletUtilities pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor:](HFWalletUtilities, "pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor:", v6));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100055DD4;
    v15[3] = &unk_1000A1558;
    v16 = v12;
    v17 = *(id *)(a1 + 40);
    v18 = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

  }
}

void sub_100055DD4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100055E7C;
  v4[3] = &unk_1000A3580;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "snapshotWithPass:completion:", v3, v4);

}

void sub_100055E7C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055F20;
  block[3] = &unk_1000A1558;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100055F20(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "walletAppIconImageView"));
  objc_msgSend(v2, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 48), "_setupWalletAppIconImageView");
}

id sub_100055F64(id *a1, void *a2)
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id *v8;
  id *v9;
  void ***v10;
  id v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "home"));
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_fetchExistingWalletKeyEncodedPKPass"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100056168;
    v16 = &unk_1000A35F8;
    v7 = &v17;
    v17 = a1[5];
    v8 = &v18;
    v18 = a1[6];
    v9 = &v19;
    v19 = a1[7];
    v10 = &v13;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_fetchAvailableWalletKeyEncodedPKPass"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000560DC;
    v20[3] = &unk_1000A35F8;
    v7 = &v21;
    v21 = a1[5];
    v8 = &v22;
    v22 = a1[6];
    v9 = &v23;
    v23 = a1[7];
    v10 = (void ***)v20;
  }
  v11 = objc_msgSend(v6, "addCompletionBlock:", v10, v13, v14, v15, v16);

  return (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
}

void sub_1000560DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = HFLogForCategory(66);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100060F70();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100056168(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = HFLogForCategory(66);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100060FE0();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100056588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000565D4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void ***v26;
  void *v27;
  void **v29;
  uint64_t v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory(66);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100061130();

  v8 = objc_opt_class(NSError, v7);
  v9 = v3;
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
    goto LABEL_12;
  if (objc_msgSend(v11, "code") != (id)8
    || !+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    v15 = objc_alloc_init((Class)NAFuture);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
    v19 = objc_msgSend(v17, "stateMachineConfigurationGetLaunchReason:", v18);

    if (!v19)
    {
      v22 = 0;
LABEL_24:
      v29 = _NSConcreteStackBlock;
      v30 = 3221225472;
      v31 = sub_100056AC4;
      v32 = &unk_1000A10A8;
      v25 = v15;
      v33 = v25;
      v26 = objc_retainBlock(&v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler", v29, v30, v31, v32));
      objc_msgSend(v27, "handleError:retryBlock:cancelBlock:", v11, v22, v26);

      v14 = v25;
      goto LABEL_25;
    }
    v20 = objc_msgSend(v11, "code");
    if (v20 == (id)8)
    {
      v21 = objc_claimAutoreleasedReturnValue(+[HFWalletUtilities walletAppFromAppStoreURL](HFWalletUtilities, "walletAppFromAppStoreURL"));
    }
    else if (v20 == (id)5)
    {
      v21 = objc_claimAutoreleasedReturnValue(+[HFWalletUtilities walletAppURL](HFWalletUtilities, "walletAppURL"));
    }
    else
    {
      if (v20 != (id)2)
      {
        v23 = 0;
        goto LABEL_23;
      }
      v21 = objc_claimAutoreleasedReturnValue(+[NSURL hf_openiCloudPreferencesURL](NSURL, "hf_openiCloudPreferencesURL"));
    }
    v23 = (void *)v21;
LABEL_23:
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000568BC;
    v34[3] = &unk_1000A1558;
    v35 = v23;
    v36 = WeakRetained;
    v37 = v15;
    v24 = v23;
    v22 = objc_retainBlock(v34);

    goto LABEL_24;
  }
  v12 = HFLogForCategory(66);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1000610C0();

LABEL_12:
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B90));
LABEL_25:

  return v14;
}

void sub_1000568BC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "openURL:", *(_QWORD *)(a1 + 32)));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000569B4;
    v7[3] = &unk_1000A3648;
    v6 = *(int8x16_t *)(a1 + 32);
    v4 = (id)v6.i64[0];
    v8 = vextq_s8(v6, v6, 8uLL);
    v9 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v3, "addCompletionBlock:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &off_1000A8B90);
  }
}

void sub_1000569B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = HFLogForCategory(66);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138413314;
    v12 = v9;
    v13 = 2080;
    v14 = "-[HSPCWalletKeyViewController commitConfiguration]_block_invoke_2";
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "(%@:%s) Retried opening url %@ with result %@ and error %@", (uint8_t *)&v11, 0x34u);
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", &off_1000A8B90);
}

id sub_100056AC4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &off_1000A8B90);
}

id sub_100056AD4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory(66);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10006119C();

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B90));
  return v7;
}

void sub_100056B68(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056C10;
  v6[3] = &unk_1000A3698;
  v6[4] = WeakRetained;
  v5 = objc_msgSend(v4, "addCompletionBlock:", v6);

}

void sub_100056C10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  if ((objc_msgSend(a2, "canAddWalletKey") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100056CC0;
    v7[3] = &unk_1000A3670;
    v7[4] = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(v5, "addCompletionBlock:", v7);

  }
}

void sub_100056CC0(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;

  if (objc_msgSend(a2, "count"))
  {
    v3 = HFLogForCategory(66);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
      v18 = 136315394;
      v19 = "-[HSPCWalletKeyViewController commitConfiguration]_block_invoke_3";
      v20 = 2112;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(HSPCWalletKeyViewController:%s) Updating hasOnboarded for Wallet Key for home %@. Current device doesn't support wallet key, but there's at least one paired watch that supports wallet key.", (uint8_t *)&v18, 0x16u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    v9 = objc_msgSend(v8, "hf_setHasOnboardedForWalletKey");

    v10 = objc_alloc((Class)HFUserItem);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "home"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "home"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentUser"));
    v16 = objc_msgSend(v10, "initWithHome:user:nameStyle:", v12, v15, 0);

    v17 = objc_msgSend(v16, "setDismissWalletKeyExpressModeOnboarding:forWalletKeyUUID:", 1, 0);
  }
}

void sub_100057990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000579C4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = sub_100005FEC();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100057CF4;
  v34[3] = &unk_1000A36C0;
  v5 = v2;
  v35 = v5;
  v6 = WeakRetained;
  v36 = v6;
  v37 = v4;
  v7 = v4;
  v8 = objc_retainBlock(v34);
  v9 = objc_msgSend(v6, "_shouldStackIcons");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scanCodeIconView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 20.0));
  objc_msgSend(v5, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scanCodeIconView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scanCodeTitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scanCodeBodyLabel"));
  ((void (*)(_QWORD *, void *, void *, void *, id, _QWORD))v8[2])(v8, v14, v15, v16, v9, 0);

  if (objc_msgSend(v6, "_isShowingNFCInstructions"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nfcIconView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scanCodeBodyLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastBaselineAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 30.0));
    objc_msgSend(v5, "addObject:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nfcIconView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nfcTitleLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nfcBodyLabel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scanCodeTitleLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    ((void (*)(_QWORD *, void *, void *, void *, id, void *))v8[2])(v8, v22, v23, v24, v9, v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nfcBodyLabel"));
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scanCodeBodyLabel"));
  }
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -10.0));
  objc_msgSend(v5, "addObject:", v31);

  v32 = v5;
  return v32;
}

void sub_100057CF4(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;

  v55 = a2;
  v11 = a3;
  v12 = a6;
  v13 = *(void **)(a1 + 32);
  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  objc_msgSend(v13, "addObject:", v18);

  v19 = *(void **)(a1 + 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v19, "addObject:", v23);

  v24 = *(void **)(a1 + 32);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  if (a5)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 15.0));
    objc_msgSend(v24, "addObject:", v27);

    v28 = *(void **)(a1 + 32);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
    objc_msgSend(v28, "addObject:", v32);

LABEL_8:
    goto LABEL_9;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v33));
  objc_msgSend(v24, "addObject:", v34);

  v35 = *(void **)(a1 + 32);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v29 = v36;
  if (!v12)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v38 = objc_msgSend(v37, "bounds");
    v41 = HUViewSizeSubclassForViewSize(v38, v39, v40);

    v42 = 20.0;
    if (!v41)
      v42 = 18.0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, v42));
    objc_msgSend(v35, "addObject:", v31);
    goto LABEL_8;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v12));
  objc_msgSend(v35, "addObject:", v30);
LABEL_9:

  v43 = *(void **)(a1 + 32);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstBaselineAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastBaselineAnchor"));
  objc_msgSend(*(id *)(a1 + 48), "_scaledValueForValue:", 20.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45));
  objc_msgSend(v43, "addObject:", v46);

  v47 = *(void **)(a1 + 32);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
  objc_msgSend(v47, "addObject:", v50);

  v51 = *(void **)(a1 + 32);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
  objc_msgSend(v51, "addObject:", v54);

}

void sub_1000580D4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "nfcTitleLabel"));
  objc_msgSend(v1, "setHidden:", 0);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "nfcBodyLabel"));
  objc_msgSend(v2, "setHidden:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "nfcIconView"));
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(WeakRetained, "_updateScanCodeIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "constraintSet"));
  objc_msgSend(v4, "invalidate");

}

id sub_1000583E0()
{
  if (qword_1000C35B0 != -1)
    dispatch_once(&qword_1000C35B0, &stru_1000A36E0);
  return (id)qword_1000C35B8;
}

void sub_100058420(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge, 0));
  v2 = (void *)qword_1000C35B8;
  qword_1000C35B8 = v1;

}

id sub_100059034(uint64_t a1, void *a2)
{
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = HFLogForCategory(58);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Skip step: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_moveToNextStep"));
  }
  else
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Show step: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanFalse));
  }
  return v8;
}

id sub_1000591F8()
{
  if (qword_1000C35C8 != -1)
    dispatch_once(&qword_1000C35C8, &stru_1000A3700);
  return (id)qword_1000C35C0;
}

void sub_100059238(id a1)
{
  uint64_t v1;
  NSBundle *v2;
  uint64_t v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(_HSMoveAlongNothingToSeeHere, v1));
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)qword_1000C35C0;
  qword_1000C35C0 = v3;

}

__CFString *sub_100059280(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v1 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = sub_1000595A8();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
      v9 = sub_1000591F8();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v1, CFSTR("_"), v8, (_QWORD)v13));

      if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("_")))
        break;

      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        v11 = CFSTR("_");
        break;
      }
    }
  }
  else
  {
    v11 = CFSTR("_");
  }

  return v11;
}

id sub_1000593D8(void *a1)
{
  return sub_1000593E4(a1, a1, 1);
}

id sub_1000593E4(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  id v14;

  v5 = a1;
  v6 = a2;
  v7 = sub_1000591F8();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v5, CFSTR("_"), CFSTR("HSLocalizable")));

  if (objc_msgSend(CFSTR("_"), "isEqualToString:", v9))
  {
    v10 = sub_100059280(v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);

    v9 = (void *)v11;
  }
  v12 = objc_msgSend(CFSTR("_"), "isEqualToString:", v9);
  if (v12)
    v13 = v6;
  else
    v13 = v9;
  if (v12 && a3)
  {
    NSLog(CFSTR("Missing localized string key %@ in table %@"), v5, CFSTR("HSLocalizable"));
    v13 = v6;
  }
  v14 = v13;

  return v14;
}

id sub_1000594E4(void *a1)
{
  return sub_1000593E4(a1, 0, 0);
}

id sub_1000594F0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17[2];

  v10 = a2;
  v11 = sub_1000593E4(a1, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v17[1] = &a9;
    v17[0] = 0;
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithValidatedFormat:validFormatSpecifiers:arguments:error:", v12, v10, &a9, v17);
    v14 = v17[0];
    v15 = v14;
    if (!v13)
      NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v12, v14);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id sub_1000595A8()
{
  if (qword_1000C35D0 != -1)
    dispatch_once(&qword_1000C35D0, &stru_1000A3720);
  return (id)qword_1000C35D8;
}

void sub_1000595E8(id a1)
{
  void *v1;

  v1 = (void *)qword_1000C35D8;
  qword_1000C35D8 = (uint64_t)&off_1000A8D28;

}

id sub_100059A40(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingController"));
  objc_msgSend(v2, "startWithHome:", *(_QWORD *)(a1 + 40));

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pairingController"));
    v6 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set up and started accessory pairing controller: %@ with home: %@", (uint8_t *)&v10, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "promise"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "future"));

  return v8;
}

void sub_10005BBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10005BBF4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "navigationController"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  if (WeakRetained == v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "coordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "didReceiveSetupCode:fromViewController:", *(_QWORD *)(a1 + 32), WeakRetained));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005BCC4;
    v8[3] = &unk_1000A22E0;
    v8[4] = WeakRetained;
    v7 = objc_msgSend(v6, "addCompletionBlock:", v8);

  }
}

void sub_10005BCC4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  v5 = v4;
  if (v4 != (void *)HFErrorDomain)
  {

LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "_moveToNextViewController");
    goto LABEL_6;
  }
  v6 = objc_msgSend(v9, "code");

  if (v6 != (id)96)
    goto LABEL_5;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8BC0));
  objc_msgSend(v7, "handleButtonDirectiveFuture:", v8);

LABEL_6:
}

void sub_10005C27C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10005C2A8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "homeManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessorySetupCoordinator"));
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005C398;
  v6[3] = &unk_1000A3770;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "createSetupAccessoryPayloadWithSetupPayloadURLString:completionHandler:", v5, v6);

  objc_destroyWeak(&v8);
}

void sub_10005C384(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10005C398(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  id v26;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = HFLogForCategory(58);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    v23 = 1024;
    v24 = objc_msgSend(v5, "requiresMatterCustomCommissioningFlow");
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "accessorySetupCoordinator createSetupAccessoryPayloadWithSetupPayloadURLString:completionHandler:, setupURLString %@, payload %@, requiresMatterCustomCommissioningFlow %d, error %@.", buf, 0x26u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "coordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "showCustomCommissioningFlowAlertIfNecessaryForPayload:onViewController:", v5, WeakRetained));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005C568;
  v17[3] = &unk_1000A3748;
  v17[4] = WeakRetained;
  v18 = v5;
  v13 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addSuccessBlock:", v17));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005C594;
  v16[3] = &unk_1000A1C28;
  v16[4] = WeakRetained;
  v15 = objc_msgSend(v14, "addFailureBlock:", v16);

}

id sub_10005C568(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePairingErrorWithPayload:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_moveToNextViewController");
}

void sub_10005C594(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8BC0));
  objc_msgSend(v1, "handleButtonDirectiveFuture:", v2);

}

void sub_10005CC00(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "setCameraReaderIsRunning:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delayedSetupCodeHandler"));
  objc_msgSend(v2, "cancel");

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "didReceiveSetupCode:fromViewController:", 0, *(_QWORD *)(a1 + 32)));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005CCC0;
  v6[3] = &unk_1000A22E0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(v4, "addCompletionBlock:", v6);

}

id sub_10005CCC0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveToNextViewController");
}

id sub_10005CDC0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCameraReaderIsRunning:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_unloadCameraReader");
}

id sub_10005CEE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraReaderIsRunning:", 0);
}

void sub_10005D01C(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = CROutputTypeHomeKitCode;
    v7 = CROutputTypeQRCode;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type", (_QWORD)v15));
        v11 = objc_msgSend(v10, "isEqual:", v6);

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
          if (v12)
            objc_msgSend(*(id *)(a1 + 40), "_handleSetupCode:", v12);
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
          v14 = objc_msgSend(v13, "isEqualToString:", v7);

          if (!v14)
            continue;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
          if (v12)
            objc_msgSend(*(id *)(a1 + 40), "_handleSetupURLString:afterDelay:", v12, 0.5);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

id sub_10005D278(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = HFLogForCategory(58);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "nfcManager:%@ didRecognizePayloadString:%@", (uint8_t *)&v7, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_handleSetupURLString:afterDelay:", *(_QWORD *)(a1 + 40), 0.0);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0, CFSTR("HSAppDelegate"));
  objc_autoreleasePoolPop(v4);
  return v5;
}

NAFuture *__cdecl sub_10005DA44(id a1, id a2)
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8BF0);
}

NAFuture *__cdecl sub_10005DA58(id a1, NSError *a2)
{
  _UNKNOWN **v2;

  if (-[NSError na_isCancelledError](a2, "na_isCancelledError"))
    v2 = &off_1000A8BD8;
  else
    v2 = &off_1000A8BF0;
  return (NAFuture *)(id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v2));
}

uint64_t sub_10005DB40(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  void *v33;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));
  v4 = objc_msgSend(v3, "hf_hasEnabledResident");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v7 = objc_msgSend(v6, "hf_userCanCreateTrigger");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allDisplayedItems"));
  v10 = objc_msgSend(v9, "count");

  if (v4)
  {
    if (v10)
      v11 = v7 ^ 1;
    else
      v11 = 1;
  }
  else
  {
    v11 = 1;
  }
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allDisplayedItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "na_map:", &stru_1000A3818));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allDisplayedItems"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%lu items)"), objc_msgSend(v13, "count")));
  }

  v16 = HFLogForCategory(62);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_opt_class(*(_QWORD *)(a1 + 32), v18);
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413570;
    v23 = v19;
    v24 = 2048;
    v25 = v20;
    v26 = 1024;
    v27 = v11;
    v28 = 1024;
    v29 = v4;
    v30 = 1024;
    v31 = v7;
    v32 = 2112;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@:%p shouldSkip=%{BOOL}d, hasEnabledResident=%{BOOL}d, userCanCreateTrigger=%{BOOL}d, displayedItems=%@", buf, 0x32u);
  }

  return v11;
}

id sub_10005DD80(id a1, HFItem *a2)
{
  return -[HFItem description](a2, "description");
}

void sub_10005DE70(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to apply onboarding selections with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_10005DEE4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Got failure trying to validate PIN Code. Continue to next prox card without setting PIN Code. %@", (uint8_t *)&v3, 0xCu);
}

void sub_10005DF5C(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v3 = objc_msgSend((id)sub_10000ECB8(a1, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", *(_QWORD *)(a1 + 48)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "addedAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_minimumDescription"));
  sub_10000ECA4();
  sub_10000EC34();
  sub_10000EC80((void *)&_mh_execute_header, v8, v9, "(%@:%s) Skipping %@ prox card because error %@ occurred for hf_fetchWalletKeyDeviceStateForCurrentDevice for accessory %@", v10, v11, v12, v13, v14);

  sub_10000EC58();
}

void sub_10005E030(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v3 = objc_msgSend((id)sub_10000ECB8(a1, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", *(_QWORD *)(a1 + 48)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "addedAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_minimumDescription"));
  sub_10000ECA4();
  sub_10000EC34();
  sub_10000EC80((void *)&_mh_execute_header, v8, v9, "(%@:%s) Skipping %@ prox card because error %@ occurred for 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 for accessory %@", v10, v11, v12, v13, v14);

  sub_10000EC58();
}

void sub_10005E104(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "addedAccessory"));
  sub_10000EC6C((void *)&_mh_execute_header, v2, v3, "(HSSetupstateMachine:%s) Skipping express mode prox card because error %@ occurred for hf_fetchWalletKeyDeviceStateForCurrentDevice for accessory %@", v4, v5, v6, v7, 2u);

  sub_10000EC94();
}

void sub_10005E1A8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  objc_opt_class(v1, v2);
  sub_10000EC6C((void *)&_mh_execute_header, v3, v4, "(%@:%s) Skipping guest access because error %@ occurred when fetching guest pin codes", v5, v6, v7, v8, 2u);

  sub_10000EC94();
}

void sub_10005E250(const char *a1, NSObject *a2)
{
  NSString *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v5, 0xCu);

}

void sub_10005E2E4(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[HSPCFaceRecognitionViewController initWithCoordinator:config:]_block_invoke_2";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

void sub_10005E36C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Footer link pressed w/ url intention but no url found", v1, 2u);
}

void sub_10005E3AC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100013588();
  sub_10001357C((void *)&_mh_execute_header, v0, v1, "Failed to fetch available Siri languages from HomeKit error %@. Applying default Onboarding selections with fallback values.", v2);
  sub_100013594();
}

void sub_10005E410(const char *a1, NSObject *a2)
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100013588();
  sub_10001357C((void *)&_mh_execute_header, a2, v5, "%@ Error fetching voice recognition languages", v6);

}

void sub_10005E498()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100013588();
  sub_10001357C((void *)&_mh_execute_header, v0, v1, "Failed to apply onboarding selections with error %@", v2);
  sub_100013594();
}

void sub_10005E4FC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to start extension manager: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10005E570(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "containingAppBundleURL"));
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to create app record from containing app bundle URL %@: %@", (uint8_t *)&v6, 0x16u);

}

void sub_10005E61C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "setupPayloadURL"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Detected an accessory that is representing itself as already paired.  URL: %@", (uint8_t *)&v4, 0xCu);

}

void sub_10005E6B0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10001357C((void *)&_mh_execute_header, a2, a3, "Failed to apply onboarding selections with error %@", (uint8_t *)&v3);
}

void sub_10005E71C(const char *a1, NSObject *a2)
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = NSStringFromSelector(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = 138412290;
  v7 = v4;
  sub_10001357C((void *)&_mh_execute_header, a2, v5, "%@ Error fetching voice recognition languages", (uint8_t *)&v6);

}

void sub_10005E7A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DC84();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "%s Failed to find ecosystem for containing app bundle URL: %@", v2, v3, v4, v5, 2u);
  sub_100013594();
}

void sub_10005E814(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "%s Unable to stage CHIP accessory with nil payload", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10005E884()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DC84();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "%s Failed to stage CHIP accessory: %@", v2, v3, v4, v5, 2u);
  sub_100013594();
}

void sub_10005E8F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "%s Invalid ecosystem", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10005E960(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "%s Unable to proceed with empty setupCode and pairingIdentifier", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10005E9D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "Failed to update accessory name with error: %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10005EA44(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to cancel staging.  id: %@, error: %@.", (uint8_t *)&v4, 0x16u);
  sub_100013594();
}

void sub_10005EAC8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s Rejecting device credential: %@ error: %@", (uint8_t *)&v4, 0x20u);
}

void sub_10005EB60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DC84();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "%s Failed to select Thread network from scan results: %@", v2, v3, v4, v5, 2u);
  sub_100013594();
}

void sub_10005EBCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DC84();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "%s Failed to select WiFi network from scan results: %@", v2, v3, v4, v5, 2u);
  sub_100013594();
}

void sub_10005EC38(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "Accessory not found soft timeout timer fired %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10005EC9C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Accessory not found fatal timeout timer fired", v1, 2u);
}

void sub_10005ECDC(uint64_t a1)
{
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10001ECD0();
  sub_10000EC6C((void *)&_mh_execute_header, v3, v4, "%@:%@ Failed to fetch Siri Voice Profile with error %@", v5, v6, v7, v8, v9);

  sub_10000EC94();
}

void sub_10005ED60(uint64_t a1)
{
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10001ECD0();
  sub_10000EC6C((void *)&_mh_execute_header, v3, v4, "%@:%@ Failed to fetch Siri Voice Profile with error %@", v5, v6, v7, v8, v9);

  sub_10000EC94();
}

void sub_10005EDE8(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v3 = *a1;
  v4 = 138412802;
  v5 = v3;
  v6 = 2080;
  v7 = "-[HSPCWalletKeyExpressModeViewController initWithCoordinator:config:]_block_invoke";
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "(%@:%s) canEvaluatePolicy is NO. error:%@", (uint8_t *)&v4, 0x20u);
}

void sub_10005EE84(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "textFieldText"));
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Invalid setup code or user canceled custom commissioning flow alert. setupCode %@, error %@", (uint8_t *)&v6, 0x16u);

}

void sub_10005EF30(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  sub_10002782C((void *)&_mh_execute_header, a2, a3, "Invalid name. Tried %@, conflicts with %@", (uint8_t *)&v5);
  sub_100013594();
}

void sub_10005EFA8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  sub_10002782C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error applying room: %@ | %@", (uint8_t *)&v4);
  sub_100013594();
}

void sub_10005F024(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Accessory name is nil", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_10005F054(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Attempting to configure accessory for a nil ecosystem", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_10005F084(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Attempted to name a single service accessory without a visible service", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_10005F0B4()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000277F8();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "Unable to apply accessory level name: %@ to accessory %@ | %@");
  sub_100027848();
}

void sub_10005F118(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error naming Television primary service: %@", (uint8_t *)&v2, 0xCu);
  sub_100013594();
}

void sub_10005F188()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000277F8();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "Unable to apply primary service level name: %@ to accessory %@ | %@");
  sub_100027848();
}

void sub_10005F1EC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  sub_10002782C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Updating date added failed with %@ for %@", (uint8_t *)&v4);
  sub_100013594();
}

void sub_10005F268(void *a1, void *a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;

  v5 = 136315650;
  v6 = "+[HSSetupStateMachineConfiguration(Helpers) configureServices:withNames:]";
  v7 = 2048;
  v8 = objc_msgSend(a1, "count");
  v9 = 2048;
  v10 = objc_msgSend(a2, "count");
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s passed different count services [%ld] and names [%ld]", (uint8_t *)&v5, 0x20u);
}

void sub_10005F324(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "+[HSSetupStateMachineConfiguration(Helpers) writeVisibilityState:toInputSourceService:]";
  v5 = 2112;
  v6 = a1;
  sub_10002782C((void *)&_mh_execute_header, a2, a3, "%s: currentVisibilityCharacteristic is nil on service: %@.  skipping write", (uint8_t *)&v3);
  sub_100013594();
}

void sub_10005F3A0()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000277F8();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "Error writing targetVisibilityState: %@ to service: %@ error: %@");
  sub_100027848();
}

void sub_10005F404(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Identify succeeded for accessory %@", (uint8_t *)&v4, 0xCu);

}

void sub_10005F49C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription"));
  sub_100029930((void *)&_mh_execute_header, v2, v3, "Identify failed for accessory %@ with error %@", v4, v5, v6, v7, 2u);

  sub_100029944();
}

void sub_10005F530(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Coordinator is nil.  Are you sure your HSProxCardConfigurable stored the coordinator passed at initialization to self.coordinator?", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_10005F560(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[PRXCardContentViewController(HSAdditions) handleButtonDirectiveFuture:target:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10005F5E8(int a1, SEL aSelector)
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = NSStringFromSelector(aSelector);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100029954();
  sub_100029930((void *)&_mh_execute_header, v4, v5, "Did not receive a future.  target (%@) action %@", v6, v7, v8, v9, v10);

  sub_100029944();
}

void sub_10005F66C(int a1, SEL aSelector)
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = NSStringFromSelector(aSelector);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100029954();
  sub_100029930((void *)&_mh_execute_header, v4, v5, "target (%@) does not respond to selector (%@)", v6, v7, v8, v9, v10);

  sub_100029944();
}

void sub_10005F6F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Action returned a non valid object.  It should return NSNumber wrapping HSSetupButtonActionDirective", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_10005F720(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Performing a PRX layout pass only makes sense in the context of a nested child VC that needs to request relayout.  Check why is self.contentVC nil", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_10005F750(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to resolve linked application", v1, 2u);
}

void sub_10005F790(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "itemDictionary"));
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to launch App Store for AirportUtility (error: %@): lookup returned %@", (uint8_t *)&v5, 0x16u);

}

void sub_10005F83C(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *SiriUICoreLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HSPCSiriSetupViewController.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_10005F8B8()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getSUICOrbViewClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HSPCSiriSetupViewController.m"), 30, CFSTR("Unable to find class %s"), "SUICOrbView");

  __break(1u);
}

void sub_10005F930(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v7 = 136315650;
  v8 = "-[HSPCWalletKeyUWBViewController _updateHasOnboardedForWalletKey:]_block_invoke";
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Received error %@ when trying to set dismissedWalletKeyUWBUnlockOnboarding flag for home %@", (uint8_t *)&v7, 0x20u);

}

void sub_10005FA00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "Expecting at least 1 accessory in function %s", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10005FA70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "Invalid mode to access function %s", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10005FAE0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[HSProxCardCoordinator _generateNextStepWithActiveTuple:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s clearing pendingConfigurationIdentifier with updatePendingConfigurationIdentifier for accessory %@ failed: %@", (uint8_t *)&v4, 0x20u);
}

void sub_10005FB78(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "-[HSProxCardCoordinator nextViewControllerWithTarget:]_block_invoke";
  v5 = 2112;
  v6 = a1;
  sub_10002782C((void *)&_mh_execute_header, a2, a3, "%s Unable to determine the next view controller: %@", (uint8_t *)&v3);
  sub_100013594();
}

void sub_10005FBF4(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = 136316162;
  v7 = "-[HSProxCardCoordinator dismissProxCardFlowAfterExecuting:]_block_invoke";
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = v4;
  v12 = 2112;
  v13 = v5;
  v14 = 2112;
  v15 = a2;
  sub_10003B510((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s updatePendingConfigurationIdentifier for accessory %@ with identifier {from: %@, to: %@} failed: %@", (uint8_t *)&v6);
}

void sub_10005FC98(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activeTuple"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "setupAccessoryDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "setupCode"));
  v9 = 136316418;
  v10 = "-[HSProxCardCoordinator resetForRetry]";
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  v17 = 2048;
  v18 = objc_msgSend(a1, "accessoryCommunicationProtocol");
  v19 = 2112;
  v20 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s tuple %@, setupAccessoryDescription %@, setupCode %@, accessoryCommunicationProtocol %ld, stateMachine %@", (uint8_t *)&v9, 0x3Eu);

}

void sub_10005FDAC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ignoring 'HomeUIService resigned active' error (HMErrorCodeOperationCancelled) because homed handles it for us by failing the pairing operation.", v1, 2u);
}

void sub_10005FDEC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  NSString *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  sub_10002782C((void *)&_mh_execute_header, a3, v7, "%@ error retrieving setup string %@", (uint8_t *)&v8);

}

void sub_10005FE94(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8[14];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "discoveredAccessory"));
  v8[0] = 136316162;
  sub_10003B4E4();
  sub_10003B510((void *)&_mh_execute_header, a3, v7, "%s Matter - Got no payload - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, result:%@]", (uint8_t *)v8);

  sub_10000EC58();
}

void sub_10005FF4C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8[14];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupAccessoryDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "discoveredAccessory"));
  v8[0] = 136316162;
  sub_10003B4E4();
  sub_10003B510((void *)&_mh_execute_header, a3, v7, "%s Invalid Setup Code - [ setupAccessoryDescription:%@, discoveredAccessory:%@, setupCode:%@, error:%@ ]", (uint8_t *)v8);

  sub_10000EC58();
}

void sub_100060004(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[HUPRXItemModuleTableViewController itemManagerDidFinishUpdate:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s invalid parent view controller", (uint8_t *)&v1, 0xCu);
}

void sub_100060084(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HomeUIService backgroundTask expired!", v1, 2u);
}

void sub_1000600C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DC84();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "%s failed to get bluetooth powerState: %@", v2, v3, v4, v5, 2u);
}

void sub_100060134()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DC84();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "%s failed to set bluetooth powerState: %@", v2, v3, v4, v5, 2u);
}

void sub_1000601A4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_100041594();
  sub_1000415B8((void *)&_mh_execute_header, v0, v1, "%s failed to toggle wifi in control center (autoJoin - [%d]) : %@", v2);
}

void sub_100060214()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_100041594();
  sub_1000415B8((void *)&_mh_execute_header, v0, v1, "%s failed to set wifi powerState (powerState - [%d]) : %@", v2);
}

void sub_100060284(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "%s Failed to find an index for the previous step in our sequence. Will progress to Error State", a5, a6, a7, a8, 2u);
}

void sub_1000602F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "%s Failed to find the next step for setup flow", a5, a6, a7, a8, 2u);
}

void sub_10006036C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "NFC: Not starting because we think our session is already running", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_10006039C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "NFC: Not supported by device", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_1000603CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "NFC: Failed to start polling: %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060430(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "NFC: Failed to start session: %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060498(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "NFC: Failed to acquire process assertion", a5, a6, a7, a8, 0);
  sub_100027850();
}

void sub_1000604C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "NFC: readerSessionDidEndUnexpectedly: %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_10006052C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error setting associated type: %@.  Continuing regardless", (uint8_t *)&v4, 0xCu);

}

void sub_1000605C0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@ error %@", (uint8_t *)&v4, 0x16u);
}

void sub_100060648(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "%s sharingFrameworkClient cannot proceed", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_1000606B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "%s unable to refresh HMHomeManager, forcing delay for 1s", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060728(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;

  v2 = 136315650;
  v3 = "-[HSProximityCardHostViewController _refreshHomeGraphWithCompletion:]_block_invoke";
  v4 = 1024;
  v5 = 116;
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s : %d unable to fetch all homes. Error: %@", (uint8_t *)&v2, 0x1Cu);
}

void sub_1000607C0()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_10001DC84();
  sub_10002782C((void *)&_mh_execute_header, v0, v1, "%s failed to initialize setup accessory description from user info: %@", (uint8_t *)v2);
  sub_100013594();
}

void sub_100060830(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315394;
  v5 = "-[HSProximityCardHostViewController configureWithContext:completion:]_block_invoke";
  v6 = 2112;
  v7 = v3;
  sub_10002782C((void *)&_mh_execute_header, a2, a3, "(%s) Aborting because there are no accessories. userInfo %@", (uint8_t *)&v4);
  sub_100013594();
}

void sub_1000608B0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "setupAccessoryDescription"));
  sub_10001DC84();
  sub_10000EC6C((void *)&_mh_execute_header, v2, v3, "%s called to set up a new accessory but we already have an HMSetupAccessoryDescription.  Treating this as a duplicate call from homed and ignoring.  Previous description: %@, new description: %@", v4, v5, v6, v7, 2u);

  sub_10000EC94();
}

void sub_100060948(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "resumeSetupHomeUUIDString"));
  v5[0] = 136315394;
  sub_10001DC84();
  sub_10002782C((void *)&_mh_execute_header, a2, v4, "%s called to set up a new accessory but we have a resume setup UUID %@, ignoring", (uint8_t *)v5);

}

void sub_1000609E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "Attempted to present ProxCardFlow with nil initial view controller %s", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060A50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a1, a3, "Attempted to present a vc that is not PRXCardContentProviding %s", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060AC0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10004AD54(a1, a2);
  sub_10004AD30();
  sub_10000EC6C((void *)&_mh_execute_header, v2, v3, "Unhandled popupType - [%@ pairingPopupDidFinish:%@ pairingPopup.popupType %lu]", v4, v5, v6, v7, v8);
  sub_10000EC94();
}

void sub_100060B34(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "setupAccessoryDescription"));
  v6 = 136315906;
  v7 = "-[HSProximityCardHostViewController _cleanup]_block_invoke";
  v8 = 1024;
  v9 = 715;
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s : %d error: %@, setupAccessoryDescription %@", (uint8_t *)&v6, 0x26u);

  sub_10000EC94();
}

void sub_100060BF8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to identify %@ : %@", (uint8_t *)&v4, 0x16u);
}

void sub_100060C80(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceNames"));
  v6 = 134218240;
  v7 = a2;
  v8 = 2048;
  v9 = objc_msgSend(v5, "count");
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Well this isn't right, textfield is tagged with an invalid row tag: %ld, totalRows: %ld", (uint8_t *)&v6, 0x16u);

}

void sub_100060D30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "Error setting audio analysis classifier options setting: %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060D94(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "Error setting dropin access level setting: %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060DF8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DC64((void *)&_mh_execute_header, a2, a3, "Error setting audio analysis onboarding key: %@", a5, a6, a7, a8, 2u);
  sub_100013594();
}

void sub_100060E5C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "HSCHIPPartnerHomeProvider asked for Homes, but no matter device setup request exists", v1, 2u);
}

void sub_100060E9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Attempting to load rooms for a nil home", a5, a6, a7, a8, 0);
}

void sub_100060ED0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027838((void *)&_mh_execute_header, a1, a3, "Attempting to load rooms for a nil ecosystem", a5, a6, a7, a8, 0);
}

void sub_100060F04()
{
  uint64_t v0;
  os_log_t v1;

  sub_100056F6C();
  sub_100056F80();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error %@ occurred when creating PKSerializedDataAccessor");
  sub_100027848();
}

void sub_100060F70()
{
  uint64_t v0;
  os_log_t v1;

  sub_100056F94();
  sub_100056F80();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error %@ occurred when fetching available wallet key encoded pass data");
  sub_100027848();
}

void sub_100060FE0()
{
  uint64_t v0;
  os_log_t v1;

  sub_100056F94();
  sub_100056F80();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error %@ occurred when fetching existing wallet key encoded pass data");
  sub_100027848();
}

void sub_100061050()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100056F6C();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "(%@:%s) Should not set up wallet app icon image view when card image view hasn't been populated yet.", v2, v3, v4, v5, v6);
}

void sub_1000610C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100056F6C();
  sub_10001DC74((void *)&_mh_execute_header, v0, v1, "(%@:%s) Continuing to next step for iPad even though error is HMHomeAddWalletKeyErrorCodeWalletAppDeleted", v2, v3, v4, v5, v6);
}

void sub_100061130()
{
  uint64_t v0;
  os_log_t v1;

  sub_100056F6C();
  sub_100056F80();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "(%@:%s) Fetched %@ for add wallet key error for current device");
  sub_100027848();
}

void sub_10006119C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100056F6C();
  sub_100056F80();
  sub_100027818((void *)&_mh_execute_header, v0, v1, "(%@:%s) Error occurred when user tapped Continue button: %@");
  sub_100027848();
}

void sub_100061208(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "-[HSAccessoryPairingFuture initWithPairingContext:discoveredAccessory:accessoryAlreadyStaged:]";
  v5 = 2112;
  v6 = a1;
  sub_10002782C((void *)&_mh_execute_header, a2, a3, "%s immediately erroring out due to parsed error: %@", (uint8_t *)&v3);
}

void sub_100061288(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pairingController"));
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  sub_10002782C((void *)&_mh_execute_header, a3, v6, "Cancelling the pairing controller (%@) due to the external unrecoverable error %@.", (uint8_t *)&v7);

}

void sub_10006132C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Either unable to parse the HMSetupAccessororyPayload or parsed an error from it: %@.  Immediately showing error screen", (uint8_t *)&v4, 0xCu);

}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_PINCodeLengthMax(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PINCodeLengthMax");
}

id objc_msgSend_PINCodeLengthMin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PINCodeLengthMin");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__addButtonWithLocalizedTitle_style_target_futureSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addButtonWithLocalizedTitle:style:target:futureSelector:");
}

id objc_msgSend__addInterruptionLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addInterruptionLabel");
}

id objc_msgSend__addWalletKeyWithExpressMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addWalletKeyWithExpressMode");
}

id objc_msgSend__addWalletKeyWithUWB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addWalletKeyWithUWB");
}

id objc_msgSend__addWalletKeyWithoutExpressMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addWalletKeyWithoutExpressMode");
}

id objc_msgSend__addWalletKeyWithoutUWB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addWalletKeyWithoutUWB");
}

id objc_msgSend__alertBaseLocalizationKeyForRequestBluetooth_Wifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_alertBaseLocalizationKeyForRequestBluetooth:Wifi:");
}

id objc_msgSend__alertLocalizedDescriptionForRequestBluetooth_Wifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_alertLocalizedDescriptionForRequestBluetooth:Wifi:");
}

id objc_msgSend__alertLocalizedTitleForRequestBluetooth_Wifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_alertLocalizedTitleForRequestBluetooth:Wifi:");
}

id objc_msgSend__allHomesDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allHomesDescription:");
}

id objc_msgSend__applyOnBoardingSelectionsWithFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyOnBoardingSelectionsWithFuture:");
}

id objc_msgSend__applyOnboardingSelections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyOnboardingSelections");
}

id objc_msgSend__applyOnboardingSelectionsIfNeededForSelectedLanguageValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyOnboardingSelectionsIfNeededForSelectedLanguageValue:");
}

id objc_msgSend__bridgedConfigurationOrdinalityString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bridgedConfigurationOrdinalityString");
}

id objc_msgSend__bulletImageWithSystemName_color_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bulletImageWithSystemName:color:");
}

id objc_msgSend__checkForiCloudSiriEnabledAndEnableVoiceRecognition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkForiCloudSiriEnabledAndEnableVoiceRecognition");
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanup");
}

id objc_msgSend__computeDenylistedAccessoryCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computeDenylistedAccessoryCategories");
}

id objc_msgSend__configurationForAccessory_stateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configurationForAccessory:stateMachine:");
}

id objc_msgSend__continueSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_continueSetup");
}

id objc_msgSend__deviceIsOnAMultiUserLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceIsOnAMultiUserLanguage");
}

id objc_msgSend__didPRXActuallyDismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didPRXActuallyDismiss");
}

id objc_msgSend__disableSiri(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disableSiri");
}

id objc_msgSend__disableVoiceRecognition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disableVoiceRecognition");
}

id objc_msgSend__discoveredAccessoryItemComparator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoveredAccessoryItemComparator");
}

id objc_msgSend__discoveredAccessoryOrSetupCodeDidUpdateFromViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoveredAccessoryOrSetupCodeDidUpdateFromViewController:");
}

id objc_msgSend__dismissSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissSetup");
}

id objc_msgSend__enableAccessIncludingGuestPinCodeItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableAccessIncludingGuestPinCodeItems:");
}

id objc_msgSend__enableExpressModeAfterAuthWithPromise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableExpressModeAfterAuthWithPromise:");
}

id objc_msgSend__enableExpressModeButtonTapped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableExpressModeButtonTapped");
}

id objc_msgSend__enableSiriWithFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableSiriWithFuture:");
}

id objc_msgSend__enableUWBOfExistingWalletKeyAfterAuthWithPromise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableUWBOfExistingWalletKeyAfterAuthWithPromise:");
}

id objc_msgSend__enableVoiceRecognition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableVoiceRecognition");
}

id objc_msgSend__enableVoiceRecognitionAndCommitConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableVoiceRecognitionAndCommitConfiguration");
}

id objc_msgSend__enabledServicesSetFromServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enabledServicesSetFromServices:");
}

id objc_msgSend__expresssModePassConflictError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_expresssModePassConflictError:");
}

id objc_msgSend__externalSystemGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_externalSystemGrayColor");
}

id objc_msgSend__findAccessoryInHomeForCoordinator_config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findAccessoryInHomeForCoordinator:config:");
}

id objc_msgSend__frozenServicesFromServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_frozenServicesFromServices:");
}

id objc_msgSend__generateNextStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateNextStep");
}

id objc_msgSend__generateNextStepWithActiveTuple_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateNextStepWithActiveTuple:");
}

id objc_msgSend__generateRoomSuggestionsWithLimit_existingRooms_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateRoomSuggestionsWithLimit:existingRooms:");
}

id objc_msgSend__getBundleIDForWalletAppIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getBundleIDForWalletAppIcon");
}

id objc_msgSend__givenNameForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_givenNameForService:");
}

id objc_msgSend__handleOverrideSetupCodeIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleOverrideSetupCodeIfNeeded");
}

id objc_msgSend__handleSetupCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSetupCode:");
}

id objc_msgSend__handleSetupURLString_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSetupURLString:afterDelay:");
}

id objc_msgSend__indexPathAllowsToggling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_indexPathAllowsToggling:");
}

id objc_msgSend__initiateSetupFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initiateSetupFlow:");
}

id objc_msgSend__isErrorInPublicHomeDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isErrorInPublicHomeDomain:");
}

id objc_msgSend__isShowingNFCInstructions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isShowingNFCInstructions");
}

id objc_msgSend__isUserListEmpty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isUserListEmpty");
}

id objc_msgSend__isVoiceRecognitionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isVoiceRecognitionEnabled");
}

id objc_msgSend__isVoiceRecognitionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isVoiceRecognitionEnabled:");
}

id objc_msgSend__languageValueMatchingRecognitionLanguage_outputVoice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_languageValueMatchingRecognitionLanguage:outputVoice:");
}

id objc_msgSend__launchSiriPrivacySheet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchSiriPrivacySheet");
}

id objc_msgSend__loadCameraReader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadCameraReader");
}

id objc_msgSend__logDetailedServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logDetailedServices");
}

id objc_msgSend__lookUpSoftwareAndUpdateUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lookUpSoftwareAndUpdateUI");
}

id objc_msgSend__moveToNextStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveToNextStep");
}

id objc_msgSend__moveToNextViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveToNextViewController");
}

id objc_msgSend__muteCharacteristicForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_muteCharacteristicForAccessory:");
}

id objc_msgSend__nfcCodeImageAssetForCurrentTraitEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nfcCodeImageAssetForCurrentTraitEnvironment");
}

id objc_msgSend__notifyRemoteReadyToDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyRemoteReadyToDisplayIfNeeded");
}

id objc_msgSend__presentProxCardFlowWithInitialViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentProxCardFlowWithInitialViewController:");
}

id objc_msgSend__presentSoftwareUpdateAlertForAirportExpress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentSoftwareUpdateAlertForAirportExpress");
}

id objc_msgSend__refreshBeforeDate_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshBeforeDate:completionHandler:");
}

id objc_msgSend__refreshHomeGraphWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshHomeGraphWithCompletion:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__reuseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reuseIdentifier");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__scanCodeImageAssetForCurrentTraitEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scanCodeImageAssetForCurrentTraitEnvironment");
}

id objc_msgSend__sendAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAnalytics:");
}

id objc_msgSend__setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAllowsAlertStacking:");
}

id objc_msgSend__setBluetoothPowerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBluetoothPowerState:");
}

id objc_msgSend__setBottomPadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBottomPadding:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setInteractiveTextSelectionDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setInteractiveTextSelectionDisabled:");
}

id objc_msgSend__setTopPadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTopPadding:");
}

id objc_msgSend__setupConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupConstraints");
}

id objc_msgSend__setupFontsForCurrentTraitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupFontsForCurrentTraitCollection");
}

id objc_msgSend__setupOnBoardSelectionsWithLanguageValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupOnBoardSelectionsWithLanguageValue:");
}

id objc_msgSend__shouldEnableShareSiriAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldEnableShareSiriAnalytics");
}

id objc_msgSend__shouldIncludeTapToUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldIncludeTapToUnlock");
}

id objc_msgSend__shouldShowHomePodChimeFeatureForHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowHomePodChimeFeatureForHome:");
}

id objc_msgSend__shouldShowSingleContinueButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowSingleContinueButton");
}

id objc_msgSend__shouldShowSiriEndpointStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowSiriEndpointStep:");
}

id objc_msgSend__shouldShowTraditionalChimeFeatureForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowTraditionalChimeFeatureForAccessory:");
}

id objc_msgSend__shouldSkipRestrictedGuestAccessStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSkipRestrictedGuestAccessStep:");
}

id objc_msgSend__shouldSkipSafetyAndSecurityStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSkipSafetyAndSecurityStep:");
}

id objc_msgSend__shouldSkipSiriUpdateRequiredStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSkipSiriUpdateRequiredStep:");
}

id objc_msgSend__shouldSkipSiriVoiceRecognitionStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSkipSiriVoiceRecognitionStep:");
}

id objc_msgSend__shouldSkipUseSiriFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSkipUseSiriFlow:");
}

id objc_msgSend__shouldSkipUseSiriStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSkipUseSiriStep:");
}

id objc_msgSend__shouldStackIcons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldStackIcons");
}

id objc_msgSend__siriEnabledOnCurrentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_siriEnabledOnCurrentDevice");
}

id objc_msgSend__startReaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startReaders");
}

id objc_msgSend__stopReaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopReaders");
}

id objc_msgSend__sync_shouldSkipPersonalRequestsStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sync_shouldSkipPersonalRequestsStep:");
}

id objc_msgSend__sync_shouldSkipSetupSiriStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sync_shouldSkipSetupSiriStep:");
}

id objc_msgSend__sync_shouldSkipSiriForEveryoneStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sync_shouldSkipSiriForEveryoneStep:");
}

id objc_msgSend__sync_shouldSkipSiriVoiceTrainingStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sync_shouldSkipSiriVoiceTrainingStep:");
}

id objc_msgSend__sync_shouldSkipStep_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sync_shouldSkipStep:withConfiguration:");
}

id objc_msgSend__sync_shouldSkipUseAirPlayStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sync_shouldSkipUseAirPlayStep:");
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:withConfiguration:");
}

id objc_msgSend__tipForIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tipForIndexPath:");
}

id objc_msgSend__tips(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tips");
}

id objc_msgSend__tupleForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tupleForAccessory:");
}

id objc_msgSend__turnOnUnlockOnApproach(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_turnOnUnlockOnApproach");
}

id objc_msgSend__unloadCameraReader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unloadCameraReader");
}

id objc_msgSend__updateAccessoryNameWithCHIPPairingIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateAccessoryNameWithCHIPPairingIdentifier:");
}

id objc_msgSend__updateBluetoothInterfaceStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateBluetoothInterfaceStatusWithCompletion:");
}

id objc_msgSend__updateCellInTableView_atIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCellInTableView:atIndexPath:");
}

id objc_msgSend__updateContinueActionEnabledFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateContinueActionEnabledFor:");
}

id objc_msgSend__updateHasOnboardedForWalletKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateHasOnboardedForWalletKey:");
}

id objc_msgSend__updateOnboardingFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateOnboardingFlags");
}

id objc_msgSend__updatePINCodesForAllUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePINCodesForAllUsers");
}

id objc_msgSend__updatePairingErrorWithPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePairingErrorWithPayload:");
}

id objc_msgSend__updatePairingStatusIfNecessary_phase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePairingStatusIfNecessary:phase:");
}

id objc_msgSend__updatePasscodeEntryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatePasscodeEntryView");
}

id objc_msgSend__updateScanCodeIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateScanCodeIcon");
}

id objc_msgSend__updateScrollingAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateScrollingAttributes");
}

id objc_msgSend__updateStatusTextAndNotifyDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStatusTextAndNotifyDelegate:");
}

id objc_msgSend__updateSubtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateSubtitle");
}

id objc_msgSend__updateUseSiriButtonEnabledState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUseSiriButtonEnabledState");
}

id objc_msgSend__updateViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateViewControllers");
}

id objc_msgSend__updateWells(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWells");
}

id objc_msgSend__voiceProfileCheckFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_voiceProfileCheckFuture");
}

id objc_msgSend__wiFiInterfaceStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_wiFiInterfaceStatus");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessories");
}

id objc_msgSend_accessoriesPendingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoriesPendingConfiguration");
}

id objc_msgSend_accessoriesToResumeSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoriesToResumeSetup");
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessory");
}

id objc_msgSend_accessoryAlreadyAdded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryAlreadyAdded");
}

id objc_msgSend_accessoryBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryBrowser");
}

id objc_msgSend_accessoryBrowsingManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryBrowsingManager");
}

id objc_msgSend_accessoryCategoryOrPrimaryServiceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryCategoryOrPrimaryServiceType");
}

id objc_msgSend_accessoryCommunicationProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryCommunicationProtocol");
}

id objc_msgSend_accessoryDiscoveryFatalTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDiscoveryFatalTimeout");
}

id objc_msgSend_accessoryDiscoverySoftTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryDiscoverySoftTimeout");
}

id objc_msgSend_accessoryName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryName");
}

id objc_msgSend_accessoryNotFoundFatalTimeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryNotFoundFatalTimeoutTimer");
}

id objc_msgSend_accessoryNotFoundSoftTimeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryNotFoundSoftTimeoutTimer");
}

id objc_msgSend_accessoryPairingEventLoggerTimeHistogramBins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryPairingEventLoggerTimeHistogramBins");
}

id objc_msgSend_accessoryProtectionGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryProtectionGroups");
}

id objc_msgSend_accessorySettingsDataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessorySettingsDataSource");
}

id objc_msgSend_accessorySetupCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessorySetupCoordinator");
}

id objc_msgSend_accessoryUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryUUID");
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryView");
}

id objc_msgSend_actionButtons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionButtons");
}

id objc_msgSend_actionInvokedForTip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionInvokedForTip:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateIfNeeded");
}

id objc_msgSend_activeTuple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeTuple");
}

id objc_msgSend_addAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAccessory:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addBrowsingObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBrowsingObserver:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCompletionBlock:");
}

id objc_msgSend_addDismissButtonWithCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDismissButtonWithCoordinator:");
}

id objc_msgSend_addDismissButtonWithCoordinator_dismissAfterExecuting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDismissButtonWithCoordinator:dismissAfterExecuting:");
}

id objc_msgSend_addFailureBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFailureBlock:");
}

id objc_msgSend_addFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFeature:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addHomeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addHomeObserver:");
}

id objc_msgSend_addIdentifyButtonWithCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIdentifyButtonWithCoordinator:");
}

id objc_msgSend_addLearnMoreButtonWithTarget_action_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLearnMoreButtonWithTarget:action:userInfo:");
}

id objc_msgSend_addLearnMoreButtonWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLearnMoreButtonWithURL:");
}

id objc_msgSend_addMoreOptionsButtonWithTarget_action_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMoreOptionsButtonWithTarget:action:userInfo:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOptionalButtonWithLocalizedTitle_target_futureSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOptionalButtonWithLocalizedTitle:target:futureSelector:");
}

id objc_msgSend_addOptionalButtonWithTitleKey_target_futureSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOptionalButtonWithTitleKey:target:futureSelector:");
}

id objc_msgSend_addOptionalDismissButtonWithLocalizedTitleKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOptionalDismissButtonWithLocalizedTitleKey:");
}

id objc_msgSend_addPairingObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPairingObserver:");
}

id objc_msgSend_addProminentButtonWithLocalizedTitle_target_futureSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProminentButtonWithLocalizedTitle:target:futureSelector:");
}

id objc_msgSend_addProminentButtonWithTitleKey_target_futureSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProminentButtonWithTitleKey:target:futureSelector:");
}

id objc_msgSend_addProminentDismissButtonWithTitleKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProminentDismissButtonWithTitleKey:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addedAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addedAccessory");
}

id objc_msgSend_addedAccessoryItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addedAccessoryItem");
}

id objc_msgSend_afterDelay_performBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "afterDelay:performBlock:");
}

id objc_msgSend_airplayIconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayIconView");
}

id objc_msgSend_airplayImageBackgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayImageBackgroundView");
}

id objc_msgSend_airplayImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayImageView");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertHostViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertHostViewController");
}

id objc_msgSend_allAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allAccessories");
}

id objc_msgSend_allAccessoryTuples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allAccessoryTuples");
}

id objc_msgSend_allDisplayedItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDisplayedItems");
}

id objc_msgSend_allHomesFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHomesFuture");
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allItems");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allowHeySiri(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowHeySiri");
}

id objc_msgSend_allowsRandomVoiceSelection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsRandomVoiceSelection");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleIdentifier");
}

id objc_msgSend_appBundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleURL");
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appIdentifier");
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appState");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendBool_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBool:withName:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:withName:");
}

id objc_msgSend_applicableServicesForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicableServicesForAccessory:");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationRecord");
}

id objc_msgSend_applyOnboardingSelections_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyOnboardingSelections:completionHandler:");
}

id objc_msgSend_areAllServicesFrozen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areAllServicesFrozen");
}

id objc_msgSend_areFeaturesSupported_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areFeaturesSupported:outError:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artistName");
}

id objc_msgSend_asciiStringForLocalizedPINString_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asciiStringForLocalizedPINString:error:");
}

id objc_msgSend_assistantAccessControlForHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assistantAccessControlForHome:");
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assistantIsEnabled");
}

id objc_msgSend_associatedServiceTypesArrayFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedServiceTypesArrayFor:");
}

id objc_msgSend_associatedServiceTypesSetFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedServiceTypesSetFor:");
}

id objc_msgSend_attributedSubtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedSubtitle");
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributedText");
}

id objc_msgSend_audioAnalysisClassifierOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioAnalysisClassifierOptions");
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoupdatingCurrentLocale");
}

id objc_msgSend_availableSiriLanguageValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableSiriLanguageValues");
}

id objc_msgSend_backgroundTaskIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundTaskIdentifier");
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundView");
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagSubProfile");
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagSubProfileVersion");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginBackgroundTaskWithName:expirationHandler:");
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginningOfDocument");
}

id objc_msgSend_bestSupportedLanguageCodeForLanguageCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestSupportedLanguageCodeForLanguageCode:");
}

id objc_msgSend_bezierPathWithRoundedRect_byRoundingCorners_cornerRadii_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:");
}

id objc_msgSend_bluetoothController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothController");
}

id objc_msgSend_bluetoothInterfaceStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothInterfaceStatus");
}

id objc_msgSend_bodyTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bodyTextView");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bridgedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bridgedAccessories");
}

id objc_msgSend_bridgedAccessoryCategoryToArrayMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bridgedAccessoryCategoryToArrayMap");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bucketizeValueIntoHistogramBin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bucketizeValueIntoHistogramBin:");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "build");
}

id objc_msgSend_buildSectionsWithDisplayedItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildSectionsWithDisplayedItems:");
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "builder");
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "builderWithObject:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_buttonWithProximityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithProximityType:");
}

id objc_msgSend_cameraContainerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraContainerView");
}

id objc_msgSend_cameraProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraProfile");
}

id objc_msgSend_cameraProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraProfiles");
}

id objc_msgSend_cameraReader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraReader");
}

id objc_msgSend_cameraReader_shouldReturnQRCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraReader:shouldReturnQRCode:");
}

id objc_msgSend_cameraReaderIsRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraReaderIsRunning");
}

id objc_msgSend_canAddWalletKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddWalletKey");
}

id objc_msgSend_canContinue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canContinue");
}

id objc_msgSend_canEvaluatePolicy_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canEvaluatePolicy:error:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPairing");
}

id objc_msgSend_cancelPairingWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPairingWithError:");
}

id objc_msgSend_cancelStagingForCHIPPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelStagingForCHIPPairing");
}

id objc_msgSend_cardImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cardImageView");
}

id objc_msgSend_cardTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cardTime");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "category");
}

id objc_msgSend_categoryType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryType");
}

id objc_msgSend_cellConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellConfiguration");
}

id objc_msgSend_cellContentViewBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellContentViewBackgroundColor");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_cellReuseIdentifierForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellReuseIdentifierForService:");
}

id objc_msgSend_cellSizeSubclass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellSizeSubclass");
}

id objc_msgSend_centerContentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerContentView");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_chainFutures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chainFutures:");
}

id objc_msgSend_characteristicTypesToPreload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characteristicTypesToPreload");
}

id objc_msgSend_checkForValidationErrorsWithPINCodeValue_originalPINCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForValidationErrorsWithPINCodeValue:originalPINCode:");
}

id objc_msgSend_checkName_inHome_withValidationOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkName:inHome:withValidationOptions:completionHandler:");
}

id objc_msgSend_checkNdefSupportsRead_andWrite_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkNdefSupportsRead:andWrite:");
}

id objc_msgSend_checkNetworkStatusAndShowAlertIfNeededForBluetooth_Wifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkNetworkStatusAndShowAlertIfNeededForBluetooth:Wifi:");
}

id objc_msgSend_checkSiriForiCloudEnabledPromptingUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkSiriForiCloudEnabledPromptingUser:");
}

id objc_msgSend_checkVoiceProfileAvailabiltyForLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkVoiceProfileAvailabiltyForLanguage:");
}

id objc_msgSend_chipDevicePairingUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chipDevicePairingUUID");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_codeInputMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeInputMethod");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView");
}

id objc_msgSend_combineAllFutures_ignoringErrors_scheduler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "combineAllFutures:ignoringErrors:scheduler:");
}

id objc_msgSend_commissioningID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commissioningID");
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitConfiguration");
}

id objc_msgSend_commitInProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitInProgress");
}

id objc_msgSend_commitItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitItem");
}

id objc_msgSend_commitSelectedItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitSelectedItems");
}

id objc_msgSend_communicationProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "communicationProtocol");
}

id objc_msgSend_communicationProtocolForSetupPayloadURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "communicationProtocolForSetupPayloadURLString:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completedInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedInfo");
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandlerAdapter");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "config");
}

id objc_msgSend_configSupportsPairing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configSupportsPairing:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationForEnablementFlow_recognitionLanguageCodes_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForEnablementFlow:recognitionLanguageCodes:completion:");
}

id objc_msgSend_configurationObjectClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationObjectClass");
}

id objc_msgSend_configurationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationState");
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_configurationWithPaletteColors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPaletteColors:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithTextStyle:scale:");
}

id objc_msgSend_configurators(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurators");
}

id objc_msgSend_configureAccessoryDateAdded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureAccessoryDateAdded");
}

id objc_msgSend_configureAccessoryName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureAccessoryName");
}

id objc_msgSend_configureAccessoryWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureAccessoryWithName:");
}

id objc_msgSend_configureCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureCard");
}

id objc_msgSend_configureDeviceWithName_room_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureDeviceWithName:room:completionHandler:");
}

id objc_msgSend_configureNextViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureNextViewController:");
}

id objc_msgSend_configureRoom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureRoom");
}

id objc_msgSend_configureService_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureService:withName:");
}

id objc_msgSend_configureServices_withNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureServices:withNames:");
}

id objc_msgSend_configuredName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuredName");
}

id objc_msgSend_confirmDeviceCredentialForStagingRequestUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmDeviceCredentialForStagingRequestUUID:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectTag_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectTag:error:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintSet");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraints");
}

id objc_msgSend_constraintsSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintsSet");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerView");
}

id objc_msgSend_containingAppBundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingAppBundleURL");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentForStep_coordinator_config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentForStep:coordinator:config:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentVC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentVC");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_continueAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueAction");
}

id objc_msgSend_controllerDidDismissWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerDidDismissWithError:");
}

id objc_msgSend_controllerDidSendInvitations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerDidSendInvitations:");
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinator");
}

id objc_msgSend_coordinator_updatedConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinator:updatedConfiguration:");
}

id objc_msgSend_coordinatorGetLaunchReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinatorGetLaunchReason:");
}

id objc_msgSend_coordinatorGetNumberOfProxCards_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinatorGetNumberOfProxCards:");
}

id objc_msgSend_coordinatorRequestedDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinatorRequestedDismissal:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createCHIPSetupPayloadStringForStagedPairingWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createCHIPSetupPayloadStringForStagedPairingWithIdentifier:completionHandler:");
}

id objc_msgSend_createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:completionHandler:");
}

id objc_msgSend_createSetupAccessoryPayloadWithSetupPayloadURLString_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSetupAccessoryPayloadWithSetupPayloadURLString:completionHandler:");
}

id objc_msgSend_createWithValidatedFileDataAccessor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createWithValidatedFileDataAccessor:");
}

id objc_msgSend_currentAssistant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAssistant");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPairing");
}

id objc_msgSend_currentStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStep");
}

id objc_msgSend_currentStepStartTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStepStartTime");
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTitle");
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTraitCollection");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_currentUserPinCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserPinCode");
}

id objc_msgSend_currentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentViewController");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decimalDigitCharacterSet");
}

id objc_msgSend_decode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decode");
}

id objc_msgSend_defaultAssociatedServiceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAssociatedServiceType");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_defaultIconDescriptorForServiceType_serviceSubtype_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultIconDescriptorForServiceType:serviceSubtype:");
}

id objc_msgSend_defaultItemComparator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultItemComparator");
}

id objc_msgSend_defaultName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultName");
}

id objc_msgSend_defaultPrivateConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultPrivateConfiguration");
}

id objc_msgSend_defaultTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTextColor");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_defineBorderWithRadius_borderWidth_borderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defineBorderWithRadius:borderWidth:borderColor:");
}

id objc_msgSend_delayedSetupCodeHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delayedSetupCodeHandler");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_denylistedAccessoryCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "denylistedAccessoryCategories");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionForPairingPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForPairingPhase:");
}

id objc_msgSend_deviceActionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceActionType");
}

id objc_msgSend_deviceClassCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceClassCode");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCompleteTextEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCompleteTextEntry:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didNotifyFinishLoading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didNotifyFinishLoading");
}

id objc_msgSend_didReceiveAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveAccessories:");
}

id objc_msgSend_didReceiveDiscoveredAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveDiscoveredAccessory:");
}

id objc_msgSend_didReceiveSetupCode_fromViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveSetupCode:fromViewController:");
}

id objc_msgSend_didSelectDiscoveredAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSelectDiscoveredAccessory:");
}

id objc_msgSend_didShowCustomCommissioningFlowAlertIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didShowCustomCommissioningFlowAlertIfNecessary");
}

id objc_msgSend_didUpdateNumberOfDiscoveredAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didUpdateNumberOfDiscoveredAccessories:");
}

id objc_msgSend_disableExternalUpdatesWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableExternalUpdatesWithReason:");
}

id objc_msgSend_disconnectTagWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectTagWithError:");
}

id objc_msgSend_discoveredAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredAccessory");
}

id objc_msgSend_discoveredAccessoryGrid_didSelectDiscoveredAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredAccessoryGrid:didSelectDiscoveredAccessory:");
}

id objc_msgSend_discoveredAccessoryGrid_didUpdateNumberOfDiscoveredAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredAccessoryGrid:didUpdateNumberOfDiscoveredAccessories:");
}

id objc_msgSend_discoveredAccessoryPickerViewControllerDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredAccessoryPickerViewControllerDelegate");
}

id objc_msgSend_discoveredAccessoryToPair(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveredAccessoryToPair");
}

id objc_msgSend_discoveryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryDate");
}

id objc_msgSend_dismissButtonAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissButtonAction");
}

id objc_msgSend_dismissButtonBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissButtonBlock");
}

id objc_msgSend_dismissFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissFuture");
}

id objc_msgSend_dismissProxCardFlowAfterExecuting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissProxCardFlowAfterExecuting:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissalType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissalType");
}

id objc_msgSend_displayAutomaticUpdatesAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayAutomaticUpdatesAlert");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayScale");
}

id objc_msgSend_displayedItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayedItemAtIndexPath:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_ecosystemForContainingAppBundleURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ecosystemForContainingAppBundleURL:");
}

id objc_msgSend_ecosystemName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ecosystemName");
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "editButtonItem");
}

id objc_msgSend_enableBluetoothAndWiFiAlertController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableBluetoothAndWiFiAlertController");
}

id objc_msgSend_enableDoorbellChime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableDoorbellChime:");
}

id objc_msgSend_enableMultiUserWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMultiUserWithCompletionHandler:");
}

id objc_msgSend_enablePinCodesForAllUsersOnNewAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enablePinCodesForAllUsersOnNewAccessory:");
}

id objc_msgSend_enablePinCodesForNewAccessory_forGuestItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enablePinCodesForNewAccessory:forGuestItems:");
}

id objc_msgSend_enableServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableServices:");
}

id objc_msgSend_enabledServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabledServices");
}

id objc_msgSend_enablementConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enablementConfiguration");
}

id objc_msgSend_enablementFlowConfigurationProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enablementFlowConfigurationProvider");
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEditing");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSession");
}

id objc_msgSend_engineOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engineOptions");
}

id objc_msgSend_entitlementContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlementContext");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_evaluatePolicy_localizedReason_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePolicy:localizedReason:reply:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_existingRooms(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingRooms");
}

id objc_msgSend_exitCardString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitCardString");
}

id objc_msgSend_expressEnablementConflictingPassDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expressEnablementConflictingPassDescription");
}

id objc_msgSend_extensionMessenger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionMessenger");
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalizedContext");
}

id objc_msgSend_failAccessorySetupWithError_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failAccessorySetupWithError:completionHandler:");
}

id objc_msgSend_featureWithTitle_detailText_icon_tintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureWithTitle:detailText:icon:tintColor:");
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "features");
}

id objc_msgSend_fetchFromAccessoryCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchFromAccessoryCache");
}

id objc_msgSend_fetchPairingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchPairingsWithCompletionHandler:");
}

id objc_msgSend_fetchPinCodeConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchPinCodeConstraints:");
}

id objc_msgSend_fetchRoomsInHome_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRoomsInHome:completionHandler:");
}

id objc_msgSend_fetchSupportedVoiceRecognitionLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchSupportedVoiceRecognitionLanguages");
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filter");
}

id objc_msgSend_filterSections_toDisplayedItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterSections:toDisplayedItems:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishAccessorySetupWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishAccessorySetupWithCompletionHandler:");
}

id objc_msgSend_finishAccessorySetupWithSetupCompletedInfo_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishAccessorySetupWithSetupCompletedInfo:completionHandler:");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithNoResult");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithResult:error:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstBaselineAnchor");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flatMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flatMap:");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontForNumberOfDigits_useMonospacedFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontForNumberOfDigits:useMonospacedFont:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_footnoteLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footnoteLabel");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frozenServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frozenServices");
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "future");
}

id objc_msgSend_futureReturningDirectiveFromTarget_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureReturningDirectiveFromTarget:selector:");
}

id objc_msgSend_futureWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithBlock:");
}

id objc_msgSend_futureWithBlock_scheduler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithBlock:scheduler:");
}

id objc_msgSend_futureWithCompletionHandlerAdapterBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithCompletionHandlerAdapterBlock:");
}

id objc_msgSend_futureWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithError:");
}

id objc_msgSend_futureWithErrorOnlyHandlerAdapterBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithErrorOnlyHandlerAdapterBlock:");
}

id objc_msgSend_futureWithNoResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithNoResult");
}

id objc_msgSend_futureWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithResult:");
}

id objc_msgSend_getImageForImageDescriptor_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getImageForImageDescriptor:completion:");
}

id objc_msgSend_getPowerStateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPowerStateWithCompletion:");
}

id objc_msgSend_getStatusTitle_statusDescription_forPairingPhase_phaseStartDate_discoveredAccessory_setupResult_context_setupError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStatusTitle:statusDescription:forPairingPhase:phaseStartDate:discoveredAccessory:setupResult:context:setupError:");
}

id objc_msgSend_globalAsyncScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalAsyncScheduler");
}

id objc_msgSend_gridBackgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridBackgroundView");
}

id objc_msgSend_gridHeightConstraint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridHeightConstraint");
}

id objc_msgSend_gridViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridViewController");
}

id objc_msgSend_guestPinCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guestPinCodes");
}

id objc_msgSend_guestsTableVC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guestsTableVC");
}

id objc_msgSend_handleButtonDirectiveFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleButtonDirectiveFuture:");
}

id objc_msgSend_handleButtonDirectiveFuture_target_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleButtonDirectiveFuture:target:");
}

id objc_msgSend_handleError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleError:");
}

id objc_msgSend_handleError_operationType_options_retryBlock_cancelBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleError:operationType:options:retryBlock:cancelBlock:");
}

id objc_msgSend_handleError_retryBlock_cancelBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleError:retryBlock:cancelBlock:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasCompletedSiriSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCompletedSiriSetup");
}

id objc_msgSend_hasOnboardedForAccessCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasOnboardedForAccessCode");
}

id objc_msgSend_hasOnboardedForWalletKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasOnboardedForWalletKey");
}

id objc_msgSend_hasOptedToHH2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasOptedToHH2");
}

id objc_msgSend_hasValidConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasValidConstraints");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_hf_accessoriesSupportingAccessCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_accessoriesSupportingAccessCodes");
}

id objc_msgSend_hf_accessorySettingAtKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_accessorySettingAtKeyPath:");
}

id objc_msgSend_hf_addWalletKeyToPairedWatchesWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_addWalletKeyToPairedWatchesWithOptions:");
}

id objc_msgSend_hf_addWalletKeyWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_addWalletKeyWithOptions:");
}

id objc_msgSend_hf_allHomePodProfileContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_allHomePodProfileContainers");
}

id objc_msgSend_hf_allHomePodsOrStereoPairs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_allHomePodsOrStereoPairs");
}

id objc_msgSend_hf_allHomePodsOrStereoPairsThatWillChime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_allHomePodsOrStereoPairsThatWillChime");
}

id objc_msgSend_hf_allUsersIncludingCurrentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_allUsersIncludingCurrentUser");
}

id objc_msgSend_hf_atleastOneMediaAccessorySupportingJustSiri(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_atleastOneMediaAccessorySupportingJustSiri");
}

id objc_msgSend_hf_attributedLinkStringForString_linkString_linkURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_attributedLinkStringForString:linkString:linkURL:");
}

id objc_msgSend_hf_bridgedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_bridgedAccessories");
}

id objc_msgSend_hf_cameraIsNotSetToRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_cameraIsNotSetToRecord");
}

id objc_msgSend_hf_categoryOrPrimaryServiceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_categoryOrPrimaryServiceType");
}

id objc_msgSend_hf_characteristicEqualToType_forServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_characteristicEqualToType:forServiceType:");
}

id objc_msgSend_hf_characteristicOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_characteristicOfType:");
}

id objc_msgSend_hf_characteristicValueManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_characteristicValueManager");
}

id objc_msgSend_hf_childServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_childServices");
}

id objc_msgSend_hf_currentUserIsAdministrator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_currentUserIsAdministrator");
}

id objc_msgSend_hf_currentUserIsOwner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_currentUserIsOwner");
}

id objc_msgSend_hf_currentUserIsRestrictedGuest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_currentUserIsRestrictedGuest");
}

id objc_msgSend_hf_dashboardSectionReorderableHomeKitObjectComparator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_dashboardSectionReorderableHomeKitObjectComparator");
}

id objc_msgSend_hf_dateAdded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_dateAdded");
}

id objc_msgSend_hf_doorbellChimeMuteCharacteristic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_doorbellChimeMuteCharacteristic");
}

id objc_msgSend_hf_effectiveServiceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_effectiveServiceType");
}

id objc_msgSend_hf_enableExpressModeForWalletKeyWithAuthData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_enableExpressModeForWalletKeyWithAuthData:");
}

id objc_msgSend_hf_enableUWBForWalletKeyWithAuthData_enableNFCExpress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_enableUWBForWalletKeyWithAuthData:enableNFCExpress:");
}

id objc_msgSend_hf_errorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_errorWithCode:");
}

id objc_msgSend_hf_errorWithCode_title_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_errorWithCode:title:description:");
}

id objc_msgSend_hf_errorWithOperationType_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_errorWithOperationType:options:");
}

id objc_msgSend_hf_extractDecimalDigits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_extractDecimalDigits");
}

id objc_msgSend_hf_fetchAccessorySettingsWithHomeIdentifier_accessoryIdentifier_keyPaths_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:");
}

id objc_msgSend_hf_fetchAvailableWalletKeyEncodedPKPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_fetchAvailableWalletKeyEncodedPKPass");
}

id objc_msgSend_hf_fetchExistingWalletKeyEncodedPKPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_fetchExistingWalletKeyEncodedPKPass");
}

id objc_msgSend_hf_fetchWalletKeyDeviceStateForCurrentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
}

id objc_msgSend_hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
}

id objc_msgSend_hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_formattedErrorForWalletKeyDeviceStateForCurrentDevice");
}

id objc_msgSend_hf_hasAtLeastOneRestrictedGuest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasAtLeastOneRestrictedGuest");
}

id objc_msgSend_hf_hasEnabledResident(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasEnabledResident");
}

id objc_msgSend_hf_hasHomeHubSupportingAccessCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasHomeHubSupportingAccessCodes");
}

id objc_msgSend_hf_hasHomeHubSupportingWalletKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasHomeHubSupportingWalletKey");
}

id objc_msgSend_hf_hasHomePods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasHomePods");
}

id objc_msgSend_hf_hasNewValidSoftwareOrFirmwareUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasNewValidSoftwareOrFirmwareUpdate");
}

id objc_msgSend_hf_hasResidentDeviceCapableOfSupportingCHIP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasResidentDeviceCapableOfSupportingCHIP");
}

id objc_msgSend_hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin");
}

id objc_msgSend_hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter");
}

id objc_msgSend_hf_hasWalletKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasWalletKey");
}

id objc_msgSend_hf_hasWalletKeyCompatibleDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_hasWalletKeyCompatibleDevice");
}

id objc_msgSend_hf_homeHubRequiredLearnMoreURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_homeHubRequiredLearnMoreURL");
}

id objc_msgSend_hf_installationGuideURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_installationGuideURL");
}

id objc_msgSend_hf_isAlreadyPairedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isAlreadyPairedError");
}

id objc_msgSend_hf_isAudioAnalysisSupportedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isAudioAnalysisSupportedDevice");
}

id objc_msgSend_hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
}

id objc_msgSend_hf_isCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isCamera");
}

id objc_msgSend_hf_isCategorizedAsBridge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isCategorizedAsBridge");
}

id objc_msgSend_hf_isCurrentDeviceWalletKeyCompatible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "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");
}

id objc_msgSend_hf_isDoorbell(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isDoorbell");
}

id objc_msgSend_hf_isDumbSpeaker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isDumbSpeaker");
}

id objc_msgSend_hf_isHMErrorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isHMErrorWithCode:");
}

id objc_msgSend_hf_isHMErrorWithCodePrivate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isHMErrorWithCodePrivate:");
}

id objc_msgSend_hf_isIdentifiable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isIdentifiable");
}

id objc_msgSend_hf_isKeyedToASpecificAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isKeyedToASpecificAccessory");
}

id objc_msgSend_hf_isLaunchedByHomeApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isLaunchedByHomeApp");
}

id objc_msgSend_hf_isLaunchedByHomeDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isLaunchedByHomeDaemon");
}

id objc_msgSend_hf_isMediaAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isMediaAccessory");
}

id objc_msgSend_hf_isNetworkProtectionSupportedForAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isNetworkProtectionSupportedForAccessories");
}

id objc_msgSend_hf_isNetworkRouter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isNetworkRouter");
}

id objc_msgSend_hf_isNetworkRouterSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isNetworkRouterSupported");
}

id objc_msgSend_hf_isProgrammableSwitch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isProgrammableSwitch");
}

id objc_msgSend_hf_isPublicHMError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isPublicHMError");
}

id objc_msgSend_hf_isRestrictedGuestAllowedAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isRestrictedGuestAllowedAccessory");
}

id objc_msgSend_hf_isSingleServiceLikeAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isSingleServiceLikeAccessory");
}

id objc_msgSend_hf_isSprinkler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isSprinkler");
}

id objc_msgSend_hf_isTelevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isTelevision");
}

id objc_msgSend_hf_isThreadNetworkRequiredError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isThreadNetworkRequiredError");
}

id objc_msgSend_hf_isWritable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_isWritable");
}

id objc_msgSend_hf_keyColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_keyColor");
}

id objc_msgSend_hf_learnAboutNetworkProtectionURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_learnAboutNetworkProtectionURL");
}

id objc_msgSend_hf_localizedLaunchingAppName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_localizedLaunchingAppName");
}

id objc_msgSend_hf_mappedHMError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_mappedHMError:");
}

id objc_msgSend_hf_marketingName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_marketingName");
}

id objc_msgSend_hf_mediaSourceComparator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_mediaSourceComparator");
}

id objc_msgSend_hf_minimumDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_minimumDescription");
}

id objc_msgSend_hf_minimumDescriptionsOfAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_minimumDescriptionsOfAccessories:");
}

id objc_msgSend_hf_openiCloudPreferencesURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_openiCloudPreferencesURL");
}

id objc_msgSend_hf_prettyDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_prettyDescription");
}

id objc_msgSend_hf_primaryService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_primaryService");
}

id objc_msgSend_hf_programmableSwitchServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_programmableSwitchServices");
}

id objc_msgSend_hf_safetyAndSecurityImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_safetyAndSecurityImage");
}

id objc_msgSend_hf_safetyAndSecuritySupportedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_safetyAndSecuritySupportedAccessories");
}

id objc_msgSend_hf_setFaceRecognitionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_setFaceRecognitionEnabled:");
}

id objc_msgSend_hf_setHasOnboardedForAccessCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_setHasOnboardedForAccessCode");
}

id objc_msgSend_hf_setHasOnboardedForWalletKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_setHasOnboardedForWalletKey");
}

id objc_msgSend_hf_siriEndpointCapableAccessoriesToOnboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_siriEndpointCapableAccessoriesToOnboard");
}

id objc_msgSend_hf_siriEndpointProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_siriEndpointProfile");
}

id objc_msgSend_hf_startSoftwareUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_startSoftwareUpdate");
}

id objc_msgSend_hf_threadNetworkRequiredLearnMoreURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_threadNetworkRequiredLearnMoreURL");
}

id objc_msgSend_hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:");
}

id objc_msgSend_hf_updateDateAdded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_updateDateAdded:");
}

id objc_msgSend_hf_updateDoorbellChime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_updateDoorbellChime:");
}

id objc_msgSend_hf_updateNetworkProtection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_updateNetworkProtection:");
}

id objc_msgSend_hf_updateWithDiscoveredAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_updateWithDiscoveredAccessory:");
}

id objc_msgSend_hf_userCanCreateTrigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_userCanCreateTrigger");
}

id objc_msgSend_hf_userFriendlyLocalizedCapitalizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_userFriendlyLocalizedCapitalizedDescription");
}

id objc_msgSend_hf_userFriendlyLocalizedCapitalizedDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_userFriendlyLocalizedCapitalizedDescription:");
}

id objc_msgSend_hf_userFriendlyLocalizedLowercaseDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_userFriendlyLocalizedLowercaseDescription");
}

id objc_msgSend_hf_userFriendlyLocalizedLowercaseDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_userFriendlyLocalizedLowercaseDescription:");
}

id objc_msgSend_hf_userIsRestrictedGuest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_userIsRestrictedGuest:");
}

id objc_msgSend_hf_visibleServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_visibleServices");
}

id objc_msgSend_hf_walletKeyAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_walletKeyAccessories");
}

id objc_msgSend_hf_walletKeyColorToDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_walletKeyColorToDisplay");
}

id objc_msgSend_hf_walletKeyDeviceStatesOfCompatiblePairedWatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
}

id objc_msgSend_hf_walletKeyUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hf_walletKeyUUID");
}

id objc_msgSend_hideActivityIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideActivityIndicator");
}

id objc_msgSend_hmfErrorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hmfErrorWithCode:");
}

id objc_msgSend_hmfUnspecifiedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hmfUnspecifiedError");
}

id objc_msgSend_hmf_isEqualToUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hmf_isEqualToUUID:");
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "home");
}

id objc_msgSend_homeAccessControlForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeAccessControlForUser:");
}

id objc_msgSend_homeAppSuggestionVendor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeAppSuggestionVendor");
}

id objc_msgSend_homeHub2OnboardingURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeHub2OnboardingURL");
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeManager");
}

id objc_msgSend_homePodChimeFeature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homePodChimeFeature");
}

id objc_msgSend_homeProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeProvider");
}

id objc_msgSend_homeUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeUUID");
}

id objc_msgSend_homes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homes");
}

id objc_msgSend_horizontalLeadingMargin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalLeadingMargin");
}

id objc_msgSend_horizontalSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalSpacing");
}

id objc_msgSend_horizontalTrailingMargin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalTrailingMargin");
}

id objc_msgSend_hsProxCardSetupUIStepForString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hsProxCardSetupUIStepForString:");
}

id objc_msgSend_hs_commitConfigurationAndDismissFutureWithContextMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hs_commitConfigurationAndDismissFutureWithContextMessage:");
}

id objc_msgSend_hs_commitConfigurationFutureWithContextMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hs_commitConfigurationFutureWithContextMessage:");
}

id objc_msgSend_hs_shouldShowAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hs_shouldShowAccessory:");
}

id objc_msgSend_hu_airPlaySpeakerImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hu_airPlaySpeakerImage");
}

id objc_msgSend_hu_preloadContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hu_preloadContent");
}

id objc_msgSend_hu_smallAirPlayAudioImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hu_smallAirPlayAudioImage");
}

id objc_msgSend_hu_systemImageNamed_withBackgroundColor_symbolColor_size_cornerRadius_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:");
}

id objc_msgSend_huisDismissDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "huisDismissDate");
}

id objc_msgSend_huisLaunchDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "huisLaunchDate");
}

id objc_msgSend_huisLaunchReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "huisLaunchReason");
}

id objc_msgSend_huisLaunchType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "huisLaunchType");
}

id objc_msgSend_huisUserType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "huisUserType");
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesMetadata");
}

id objc_msgSend_iconDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconDescriptor");
}

id objc_msgSend_iconDescriptorForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconDescriptorForAccessory:");
}

id objc_msgSend_iconDescriptorForAccessoryCategoryOrServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconDescriptorForAccessoryCategoryOrServiceType:");
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconView");
}

id objc_msgSend_identify(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identify");
}

id objc_msgSend_identifyButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifyButton");
}

id objc_msgSend_identifyPeopleFeature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifyPeopleFeature");
}

id objc_msgSend_identifyWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifyWithCompletionHandler:");
}

id objc_msgSend_idleTimerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idleTimerAssertion");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageByApplyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageProperties");
}

id objc_msgSend_imageViewWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageViewWithStyle:");
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexPathForItemAtPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForItemAtPoint:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForSelectedRow");
}

id objc_msgSend_indexPathOfFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathOfFirstResponder");
}

id objc_msgSend_indexPathsForSelectedRows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathsForSelectedRows");
}

id objc_msgSend_initCompactWithRecognitionLanguage_allowsRandomSelection_dataManager_customVoicePreviewer_forSelectionStyle_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCompactWithRecognitionLanguage:allowsRandomSelection:dataManager:customVoicePreviewer:forSelectionStyle:delegate:");
}

id objc_msgSend_initWithAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessory:");
}

id objc_msgSend_initWithAccessory_valueSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessory:valueSource:");
}

id objc_msgSend_initWithAccessoryBrowsingManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryBrowsingManager:");
}

id objc_msgSend_initWithAccessoryBrowsingManager_delegate_discoveredAccessoryFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryBrowsingManager:delegate:discoveredAccessoryFilter:");
}

id objc_msgSend_initWithAccessoryBrowsingManager_discoveredAccessoryFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryBrowsingManager:discoveredAccessoryFilter:");
}

id objc_msgSend_initWithAccessoryBrowsingManager_entitlementContext_setupAccessoryDescription_matterDeviceSetupRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryBrowsingManager:entitlementContext:setupAccessoryDescription:matterDeviceSetupRequest:");
}

id objc_msgSend_initWithAccessoryUUID_accessoryName_accessoryCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryUUID:accessoryName:accessoryCategory:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAddedItems_removedItems_existingItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddedItems:removedItems:existingItems:");
}

id objc_msgSend_initWithAlertHostViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAlertHostViewController:");
}

id objc_msgSend_initWithApplicationProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationProxy:");
}

id objc_msgSend_initWithApplicationRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationRecord:");
}

id objc_msgSend_initWithBag_caller_keyProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBag:caller:keyProfile:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleID_storeID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:storeID:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCardStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCardStyle:");
}

id objc_msgSend_initWithCardStyle_scrollView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCardStyle:scrollView:");
}

id objc_msgSend_initWithContainingAppBundleURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainingAppBundleURL:");
}

id objc_msgSend_initWithContentView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentView:");
}

id objc_msgSend_initWithContentViewController_configurationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentViewController:configurationDelegate:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithContext_discoveredAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:discoveredAccessory:");
}

id objc_msgSend_initWithCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinator:");
}

id objc_msgSend_initWithCoordinator_config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinator:config:");
}

id objc_msgSend_initWithCoordinator_config_iconView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinator:config:iconView:");
}

id objc_msgSend_initWithCoordinator_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinator:configuration:");
}

id objc_msgSend_initWithCoordinator_configurationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinator:configurationDelegate:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:error:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_serviceLikeItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:serviceLikeItems:");
}

id objc_msgSend_initWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionaryRepresentation:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEntitlementContext_setupAccessoryDescription_matterDeviceSetupRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEntitlementContext:setupAccessoryDescription:matterDeviceSetupRequest:");
}

id objc_msgSend_initWithExistingObject_inHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExistingObject:inHome:");
}

id objc_msgSend_initWithExtensionMessenger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExtensionMessenger:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_categoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:categoryType:");
}

id objc_msgSend_initWithFrame_contentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:contentMode:");
}

id objc_msgSend_initWithFrame_item_iconOnlyTile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:item:iconOnlyTile:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithHAPSetupCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHAPSetupCode:");
}

id objc_msgSend_initWithHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHome:");
}

id objc_msgSend_initWithHome_accessories_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHome:accessories:delegate:");
}

id objc_msgSend_initWithHome_accessoryDescription_matterDeviceSetupRequest_setupSpecificAccessory_entitlementContext_discoveredAccessory_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHome:accessoryDescription:matterDeviceSetupRequest:setupSpecificAccessory:entitlementContext:discoveredAccessory:delegate:");
}

id objc_msgSend_initWithHome_pinCodeManager_listType_forAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHome:pinCodeManager:listType:forAccessory:");
}

id objc_msgSend_initWithHome_user_nameStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHome:user:nameStyle:");
}

id objc_msgSend_initWithHomeMangerConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHomeMangerConfiguration:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImage_highlightedImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:highlightedImage:");
}

id objc_msgSend_initWithInputLanguageCode_listOfVoices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInputLanguageCode:listOfVoices:");
}

id objc_msgSend_initWithItemUpdater_cameraProfiles_displayStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItemUpdater:cameraProfiles:displayStyle:");
}

id objc_msgSend_initWithItemUpdater_home_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItemUpdater:home:");
}

id objc_msgSend_initWithItemUpdater_home_accessoryToAdd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItemUpdater:home:accessoryToAdd:");
}

id objc_msgSend_initWithItemUpdater_home_displayStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItemUpdater:home:displayStyle:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithItems_itemUpdater_home_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItems:itemUpdater:home:context:");
}

id objc_msgSend_initWithModule_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModule:");
}

id objc_msgSend_initWithModule_host_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModule:host:");
}

id objc_msgSend_initWithNFCStartFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNFCStartFuture:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_bundleID_payloadURL_storeURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:bundleID:payloadURL:storeURL:");
}

id objc_msgSend_initWithNumberOfDigits_useMonospacedFont_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNumberOfDigits:useMonospacedFont:delegate:");
}

id objc_msgSend_initWithOwningView_constraintBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOwningView:constraintBuilder:");
}

id objc_msgSend_initWithPID_flags_reason_name_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPID:flags:reason:name:withHandler:");
}

id objc_msgSend_initWithPackageIdentifier_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackageIdentifier:state:");
}

id objc_msgSend_initWithPairingContext_discoveredAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPairingContext:discoveredAccessory:");
}

id objc_msgSend_initWithPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayload:");
}

id objc_msgSend_initWithPayload_hasAddRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayload:hasAddRequest:");
}

id objc_msgSend_initWithPinCode_inHome_onAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPinCode:inHome:onAccessory:");
}

id objc_msgSend_initWithPinCodeManager_delegate_home_forAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPinCodeManager:delegate:home:forAccessory:");
}

id objc_msgSend_initWithPopupDelegate_setupAccessoryDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPopupDelegate:setupAccessoryDescription:");
}

id objc_msgSend_initWithRoomBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRoomBuilder:");
}

id objc_msgSend_initWithServiceLikeBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceLikeBuilder:");
}

id objc_msgSend_initWithSetupAccessoryDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSetupAccessoryDescription:");
}

id objc_msgSend_initWithSetupAccessoryDescription_isTrustedOrigin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSetupAccessoryDescription:isTrustedOrigin:");
}

id objc_msgSend_initWithSiriEnabled_allowHeySiri_airPlayEnabled_playbackInfluencesForYouEnabled_shareSiriAnalyticsEnabled_explicitContentAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:");
}

id objc_msgSend_initWithSiriEnabled_allowHeySiri_airPlayEnabled_playbackInfluencesForYouEnabled_shareSiriAnalyticsEnabled_explicitContentAllowed_languageValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:");
}

id objc_msgSend_initWithSize_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:scale:");
}

id objc_msgSend_initWithStoreItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStoreItem:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithSystemImageNamed_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSystemImageNamed:configuration:");
}

id objc_msgSend_initWithTableView_viewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTableView:viewController:");
}

id objc_msgSend_initWithTableViewStyle_moduleCreator_moduleControllerBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTarget_action_hitBoxString_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:hitBoxString:userInfo:");
}

id objc_msgSend_initWithTitle_detailText_icon_tintColor_valueChangedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:detailText:icon:tintColor:valueChangedBlock:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithValidatedFormat_validFormatSpecifiers_arguments_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidatedFormat:validFormatSpecifiers:arguments:error:");
}

id objc_msgSend_initWithValueSource_mediaProfileContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValueSource:mediaProfileContainer:");
}

id objc_msgSend_initWithViewControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithViewControllers:");
}

id objc_msgSend_initialHomePodChimeState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialHomePodChimeState");
}

id objc_msgSend_initialRowIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialRowIndex");
}

id objc_msgSend_inputLanguageCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputLanguageCode");
}

id objc_msgSend_inputSourceServicesForAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputSourceServicesForAccessory:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interWellSpacingForNumberOfDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interWellSpacingForNumberOfDigits:");
}

id objc_msgSend_interruptionLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interruptionLabel");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateIntrinsicContentSize");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_invitations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invitations");
}

id objc_msgSend_isAnIPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnIPad");
}

id objc_msgSend_isAnIPhone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnIPhone");
}

id objc_msgSend_isBridged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBridged");
}

id objc_msgSend_isCleaningUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCleaningUp");
}

id objc_msgSend_isConfiguringLastAccessoryOfSameCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConfiguringLastAccessoryOfSameCategory");
}

id objc_msgSend_isDeviceUsingASupportedVoiceRecognitionSiriLanguage_shouldFallbackToBestSupportedLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:");
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEditing");
}

id objc_msgSend_isEntitledForAll3rdPartyAccessoryTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEntitledForAll3rdPartyAccessoryTypes");
}

id objc_msgSend_isEntitledForHomeKitSPI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEntitledForHomeKitSPI");
}

id objc_msgSend_isEntitledForThirdPartyMatterSetupPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEntitledForThirdPartyMatterSetupPayload");
}

id objc_msgSend_isEntitledForThirdPartySetupAccessoryPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEntitledForThirdPartySetupAccessoryPayload");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToAttributedString:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExplicitContentAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExplicitContentAllowed");
}

id objc_msgSend_isExpressEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExpressEnabled");
}

id objc_msgSend_isFaceClassificationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFaceClassificationEnabled");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isFirstDetectedCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstDetectedCard");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstResponder");
}

id objc_msgSend_isHUISLaunchedByFirstParty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHUISLaunchedByFirstParty");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isHomePodChimeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHomePodChimeEnabled");
}

id objc_msgSend_isIdentifyVoiceEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIdentifyVoiceEnabled");
}

id objc_msgSend_isInSetupContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInSetupContext");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalled");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isInternalTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalTest");
}

id objc_msgSend_isLaunchedToSetupASpecificAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLaunchedToSetupASpecificAccessory");
}

id objc_msgSend_isMultiUserEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultiUserEnabled");
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOn");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaired");
}

id objc_msgSend_isPlaybackInfluencesForYouEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaybackInfluencesForYouEnabled");
}

id objc_msgSend_isPreloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPreloaded");
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReachable");
}

id objc_msgSend_isServiceSelectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServiceSelectable:");
}

id objc_msgSend_isSetupComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSetupComplete");
}

id objc_msgSend_isSetupInitiatedByOtherMatterEcosystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSetupInitiatedByOtherMatterEcosystem");
}

id objc_msgSend_isSetupPayloadURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSetupPayloadURLString:");
}

id objc_msgSend_isShareSiriAnalyticsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isShareSiriAnalyticsEnabled");
}

id objc_msgSend_isSiriAssistant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSiriAssistant");
}

id objc_msgSend_isSiriEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSiriEnabled");
}

id objc_msgSend_isTraditionalChimeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTraditionalChimeEnabled");
}

id objc_msgSend_isUWBUnlockEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUWBUnlockEnabled");
}

id objc_msgSend_isUnknownGuest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUnknownGuest");
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserInteractionEnabled");
}

id objc_msgSend_isUsingCHIPCommunicationProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingCHIPCommunicationProtocol");
}

id objc_msgSend_isUsingHAPCommunicationProtocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingHAPCommunicationProtocol");
}

id objc_msgSend_isUsingiCloud(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingiCloud");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isVoiceProfileAvailableOnThisDeviceForLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVoiceProfileAvailableOnThisDeviceForLanguage:");
}

id objc_msgSend_itemDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemDictionary");
}

id objc_msgSend_itemManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemManager");
}

id objc_msgSend_itemManagerDidFinishUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemManagerDidFinishUpdate:");
}

id objc_msgSend_itemProviders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemProviders");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_itemsToHideInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemsToHideInSet:");
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPath");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_knownToSystemCommissioner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knownToSystemCommissioner");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_labelConfiguration_forItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelConfiguration:forItem:");
}

id objc_msgSend_labelWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelWithStyle:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languageCode");
}

id objc_msgSend_languageValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languageValue");
}

id objc_msgSend_largeContentSizeCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "largeContentSizeCategories");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_latestResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestResults");
}

id objc_msgSend_launchReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchReason");
}

id objc_msgSend_launchReasonDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchReasonDescription:");
}

id objc_msgSend_launchReasonFromUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchReasonFromUserInfo:");
}

id objc_msgSend_launchType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchType");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_lazyFutureWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lazyFutureWithBlock:");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leadingKeylineLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingKeylineLayer");
}

id objc_msgSend_leadingSeparatorMargin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingSeparatorMargin");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftBarButtonItem");
}

id objc_msgSend_leftImageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftImageSize");
}

id objc_msgSend_leftView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftView");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lightGrayColor");
}

id objc_msgSend_linkedApplicationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkedApplicationItem");
}

id objc_msgSend_listOfVoices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listOfVoices");
}

id objc_msgSend_loadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadData");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedLanguageToLanguageCodeMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedLanguageToLanguageCodeMap");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedNameForSiriLanguage_inDisplayLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedNameForSiriLanguage:inDisplayLanguage:");
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_lockAccessUpdateViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockAccessUpdateViewController");
}

id objc_msgSend_logAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logAccessory:");
}

id objc_msgSend_logCardCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logCardCount:");
}

id objc_msgSend_logCodeInputMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logCodeInputMethod:");
}

id objc_msgSend_logError_operationDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logError:operationDescription:");
}

id objc_msgSend_logHUISDismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logHUISDismiss");
}

id objc_msgSend_logHUISLaunchWithReason_accessoryDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logHUISLaunchWithReason:accessoryDescription:");
}

id objc_msgSend_logHUISUserType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logHUISUserType:");
}

id objc_msgSend_logIsUsingCHIPCommunicationProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logIsUsingCHIPCommunicationProtocol:");
}

id objc_msgSend_logLaunchedToSetupASpecificAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logLaunchedToSetupASpecificAccessory:");
}

id objc_msgSend_logNumberOfPairedAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logNumberOfPairedAccessories:");
}

id objc_msgSend_logPairingBegin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logPairingBegin");
}

id objc_msgSend_logPairingComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logPairingComplete");
}

id objc_msgSend_logStepStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logStepStart:");
}

id objc_msgSend_logTransportFlagsFromPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logTransportFlagsFromPayload:");
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainContentGuide");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainThreadScheduler");
}

id objc_msgSend_manualEntryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manualEntryCode");
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manufacturer");
}

id objc_msgSend_margin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "margin");
}

id objc_msgSend_matchedLibraryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchedLibraryItems");
}

id objc_msgSend_matchedStoreItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchedStoreItems");
}

id objc_msgSend_matterDeviceSetupRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matterDeviceSetupRequest");
}

id objc_msgSend_matterSetupPairingWindowReadyFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matterSetupPairingWindowReadyFuture");
}

id objc_msgSend_mediaProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaProfile");
}

id objc_msgSend_mediaSourceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaSourceIdentifier");
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "menuWithChildren:");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_modalPresentationStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modalPresentationStyle");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_monospacedDigitSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monospacedDigitSystemFontOfSize:weight:");
}

id objc_msgSend_monospacedSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monospacedSystemFontOfSize:weight:");
}

id objc_msgSend_moveToNextStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveToNextStep");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mvvmController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mvvmController");
}

id objc_msgSend_na_any_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_any:");
}

id objc_msgSend_na_arrayWithSafeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_arrayWithSafeObject:");
}

id objc_msgSend_na_dictionaryByBucketingObjectsUsingKeyGenerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_dictionaryByBucketingObjectsUsingKeyGenerator:");
}

id objc_msgSend_na_each_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_each:");
}

id objc_msgSend_na_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_filter:");
}

id objc_msgSend_na_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_firstObjectPassingTest:");
}

id objc_msgSend_na_flatMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_flatMap:");
}

id objc_msgSend_na_genericError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_genericError");
}

id objc_msgSend_na_isCancelledError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_isCancelledError");
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_map:");
}

id objc_msgSend_na_safeAddObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_safeAddObject:");
}

id objc_msgSend_na_safeAddObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_safeAddObjectsFromArray:");
}

id objc_msgSend_na_safeSetObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_safeSetObject:forKey:");
}

id objc_msgSend_na_setByRemovingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_setByRemovingObjectsFromSet:");
}

id objc_msgSend_na_setWithSafeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "na_setWithSafeObject:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_ndefReadWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ndefReadWithError:");
}

id objc_msgSend_nearFieldReaderSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearFieldReaderSession");
}

id objc_msgSend_networkInterfaceManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkInterfaceManager");
}

id objc_msgSend_networkRouterSupportDisableReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkRouterSupportDisableReason");
}

id objc_msgSend_newAssertionToDisableIdleTimerForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newAssertionToDisableIdleTimerForReason:");
}

id objc_msgSend_nextUnconfiguredBridgedAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextUnconfiguredBridgedAccessory");
}

id objc_msgSend_nextViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextViewController");
}

id objc_msgSend_nextViewControllerWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextViewControllerWithTarget:");
}

id objc_msgSend_nfcAvailableFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcAvailableFuture");
}

id objc_msgSend_nfcBodyLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcBodyLabel");
}

id objc_msgSend_nfcIconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcIconView");
}

id objc_msgSend_nfcManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcManager");
}

id objc_msgSend_nfcManager_didRecognizePayloadString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcManager:didRecognizePayloadString:");
}

id objc_msgSend_nfcManager_shouldReturnPayloadString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcManager:shouldReturnPayloadString:");
}

id objc_msgSend_nfcTitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nfcTitleLabel");
}

id objc_msgSend_nodeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nodeID");
}

id objc_msgSend_notifyDelegateOfPairingFailureWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyDelegateOfPairingFailureWithError:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numCards(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numCards");
}

id objc_msgSend_numPairedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numPairedAccessories");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfAccessoriesInSameCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfAccessoriesInSameCategory");
}

id objc_msgSend_numberOfDigits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfDigits");
}

id objc_msgSend_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfRowsInSection:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onSetupAccessoryDescription_matterDeviceSetupRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onSetupAccessoryDescription:matterDeviceSetupRequest:");
}

id objc_msgSend_onboardingSelections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onboardingSelections");
}

id objc_msgSend_openApplicationWithBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplicationWithBundleID:");
}

id objc_msgSend_openSensitiveURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:");
}

id objc_msgSend_optionalAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionalAction");
}

id objc_msgSend_outputGenderFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputGenderFromString:");
}

id objc_msgSend_outputVoice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputVoice");
}

id objc_msgSend_outputVoiceGenderCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputVoiceGenderCode");
}

id objc_msgSend_outputVoiceLanguageCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputVoiceLanguageCode");
}

id objc_msgSend_overallSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overallSession");
}

id objc_msgSend_overrideHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideHome");
}

id objc_msgSend_overrideIconDescriptorForMultiServiceAccessory_iconDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideIconDescriptorForMultiServiceAccessory:iconDescriptor:");
}

id objc_msgSend_packageIconIdentifierForHome_shouldUseKeyholeAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packageIconIdentifierForHome:shouldUseKeyholeAsset:");
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "page");
}

id objc_msgSend_pairAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairAccessory");
}

id objc_msgSend_pairDeviceInHome_onboardingPayload_uuid_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairDeviceInHome:onboardingPayload:uuid:completionHandler:");
}

id objc_msgSend_pairStagedCHIPAccessoryToPartnerAppHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairStagedCHIPAccessoryToPartnerAppHome");
}

id objc_msgSend_pairedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedAccessories");
}

id objc_msgSend_pairingBeginDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingBeginDate");
}

id objc_msgSend_pairingCompleteDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingCompleteDate");
}

id objc_msgSend_pairingContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingContext");
}

id objc_msgSend_pairingController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingController");
}

id objc_msgSend_pairingController_didTransitionToPhase_statusTitle_statusDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingController:didTransitionToPhase:statusTitle:statusDescription:");
}

id objc_msgSend_pairingError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingError");
}

id objc_msgSend_pairingFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingFuture");
}

id objc_msgSend_pairingManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingManager");
}

id objc_msgSend_pairingObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingObserver");
}

id objc_msgSend_pairingObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingObservers");
}

id objc_msgSend_pairingPopupDidCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPopupDidCancel:");
}

id objc_msgSend_pairingPopupDidFinish_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingPopupDidFinish:");
}

id objc_msgSend_pairingState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingState");
}

id objc_msgSend_pairingStatusDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingStatusDescription");
}

id objc_msgSend_pairingStatusTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingStatusTitle");
}

id objc_msgSend_pairingSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingSuccess");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_passcodeEntryViewDidBecomeFirstResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryViewDidBecomeFirstResponder:");
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paymentPass");
}

id objc_msgSend_pendingConfigurationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingConfigurationIdentifier");
}

id objc_msgSend_performLookupWithBundleIdentifiers_itemIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performLookupWithBundleIdentifiers:itemIdentifiers:");
}

id objc_msgSend_performPRXLayoutPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performPRXLayoutPass");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_personManagerSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personManagerSettings");
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase");
}

id objc_msgSend_phaseStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phaseStartDate");
}

id objc_msgSend_pickerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pickerView");
}

id objc_msgSend_pinCodeManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinCodeManager");
}

id objc_msgSend_pinCodeManagerForHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinCodeManagerForHome:");
}

id objc_msgSend_pinCodeValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinCodeValue");
}

id objc_msgSend_pinSides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinSides");
}

id objc_msgSend_pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pkPassHomeKeyLiveRenderTypeForHMHomeWalletKeyColor:");
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholder");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointSize");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_popupDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popupDelegate");
}

id objc_msgSend_popupType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popupType");
}

id objc_msgSend_positionFromPosition_offset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "positionFromPosition:offset:");
}

id objc_msgSend_possibleAssociatedServiceTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "possibleAssociatedServiceTypes");
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerOn");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_traits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:traits:");
}

id objc_msgSend_preferredSizeForNumberOfDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredSizeForNumberOfDigits:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "present");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:configuration:");
}

id objc_msgSend_presentShareSiriAndDictationAlertForMultipleAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentShareSiriAndDictationAlertForMultipleAccessories:");
}

id objc_msgSend_presentShareSiriAndDictationAlertForSingleAccessory_accessoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentShareSiriAndDictationAlertForSingleAccessory:accessoryName:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presenterForPrivacySplashWithIdentifer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenterForPrivacySplashWithIdentifer:");
}

id objc_msgSend_priorityComparator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priorityComparator");
}

id objc_msgSend_processThirdPartyAccessorySetupProgressChange_currentPhase_context_discoveredAccessory_setupResult_callerClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processThirdPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:callerClass:");
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productID");
}

id objc_msgSend_productPageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productPageURL");
}

id objc_msgSend_prominentButtonLocalizedTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prominentButtonLocalizedTitle");
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promise");
}

id objc_msgSend_providerForCoordinator_config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerForCoordinator:config:");
}

id objc_msgSend_proxNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxNavigationController");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_qrCodeString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "qrCodeString:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rawSetupPayloadString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawSetupPayloadString");
}

id objc_msgSend_readCharacteristics_inServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readCharacteristics:inServices:");
}

id objc_msgSend_readValuesForCharacteristics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readValuesForCharacteristics:");
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readableContentGuide");
}

id objc_msgSend_readerSupportedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readerSupportedWithError:");
}

id objc_msgSend_recognitionLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recognitionLanguage");
}

id objc_msgSend_recognitionLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recognitionLanguages");
}

id objc_msgSend_recommendationModule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recommendationModule");
}

id objc_msgSend_recommendationModuleController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recommendationModuleController");
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "records");
}

id objc_msgSend_recover_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recover:");
}

id objc_msgSend_recoverIgnoringError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoverIgnoringError");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redColor");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_rejectDeviceCredentialForStagingRequestUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rejectDeviceCredentialForStagingRequestUUID:");
}

id objc_msgSend_releaseIdleTimerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseIdleTimerAssertion");
}

id objc_msgSend_reloadAllComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadAllComponents");
}

id objc_msgSend_reloadAndUpdateItemsForProviders_senderSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadAndUpdateItemsForProviders:senderSelector:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_removeAccessory_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAccessory:completionHandler:");
}

id objc_msgSend_removeBrowsingObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBrowsingObserver:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePairingObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePairingObserver:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_requiresDismissalConfirmation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresDismissalConfirmation");
}

id objc_msgSend_requiresDismissalConfirmation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresDismissalConfirmation:");
}

id objc_msgSend_requiresIdentifyButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresIdentifyButton");
}

id objc_msgSend_requiresIdentifyButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresIdentifyButton:");
}

id objc_msgSend_requiresMatterCustomCommissioningFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresMatterCustomCommissioningFlow");
}

id objc_msgSend_requiresOwnerToPair(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresOwnerToPair");
}

id objc_msgSend_requiresSetupCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresSetupCode");
}

id objc_msgSend_requiresSoftwareUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresSoftwareUpdate");
}

id objc_msgSend_requiresThreadRouter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresThreadRouter");
}

id objc_msgSend_requiresVoiceSelectionForRecognitionLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresVoiceSelectionForRecognitionLanguage:");
}

id objc_msgSend_reschedule_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reschedule:");
}

id objc_msgSend_resetForRetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetForRetry");
}

id objc_msgSend_resetItemProvidersAndModules(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetItemProvidersAndModules");
}

id objc_msgSend_residentDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "residentDevices");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resultForRequests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultForRequests:");
}

id objc_msgSend_resumeSetupHomeUUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSetupHomeUUIDString");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_room(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "room");
}

id objc_msgSend_roomBuilder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roomBuilder");
}

id objc_msgSend_roomBuilderItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roomBuilderItem");
}

id objc_msgSend_roomForEntireHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roomForEntireHome");
}

id objc_msgSend_roomName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roomName");
}

id objc_msgSend_roomProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roomProvider");
}

id objc_msgSend_roomSuggestions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roomSuggestions");
}

id objc_msgSend_rooms(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rooms");
}

id objc_msgSend_rootPublicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootPublicKey");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_sanitizeAutoGeneratedHomeKitName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sanitizeAutoGeneratedHomeKitName:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scanCodeBodyLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanCodeBodyLabel");
}

id objc_msgSend_scanCodeIconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanCodeIconView");
}

id objc_msgSend_scanCodeTitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanCodeTitleLabel");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screen");
}

id objc_msgSend_scrollDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollDirection");
}

id objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondarySystemBackgroundColor");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "section");
}

id objc_msgSend_selectRow_inComponent_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectRow:inComponent:animated:");
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectThreadNetworkAssociation_forStagingRequestUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectThreadNetworkAssociation:forStagingRequestUUID:");
}

id objc_msgSend_selectThreadNetworkFromScanResults_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectThreadNetworkFromScanResults:completionHandler:");
}

id objc_msgSend_selectWiFiNetworkAssociation_forStagingRequestUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectWiFiNetworkAssociation:forStagingRequestUUID:");
}

id objc_msgSend_selectWiFiNetworkFromScanResults_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectWiFiNetworkFromScanResults:completionHandler:");
}

id objc_msgSend_selectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedAccessories");
}

id objc_msgSend_selectedPartnerHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedPartnerHome");
}

id objc_msgSend_selectedPartnerRoom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedPartnerRoom");
}

id objc_msgSend_selectedRowInComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedRowInComponent:");
}

id objc_msgSend_selectedSiriRecognitionLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedSiriRecognitionLanguage");
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendActionsForControlEvents:");
}

id objc_msgSend_sendEvent_withData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:withData:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceCellOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceCellOptions");
}

id objc_msgSend_serviceComparator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceComparator");
}

id objc_msgSend_serviceForIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceForIndexPath:");
}

id objc_msgSend_serviceLikeBuilder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceLikeBuilder");
}

id objc_msgSend_serviceLikeItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceLikeItems");
}

id objc_msgSend_serviceNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceNames");
}

id objc_msgSend_serviceTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceTextView");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceType");
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "services");
}

id objc_msgSend_servicesToPreload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "servicesToPreload");
}

id objc_msgSend_sessionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionQueue");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessories:");
}

id objc_msgSend_setAccessoriesToResumeSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoriesToResumeSetup:");
}

id objc_msgSend_setAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessory:");
}

id objc_msgSend_setAccessoryAlreadyAdded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryAlreadyAdded:");
}

id objc_msgSend_setAccessoryCommunicationProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryCommunicationProtocol:");
}

id objc_msgSend_setAccessoryManufacturer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryManufacturer:");
}

id objc_msgSend_setAccessoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryName:");
}

id objc_msgSend_setAccessoryNotFoundFatalTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryNotFoundFatalTimeoutTimer:");
}

id objc_msgSend_setAccessoryNotFoundSoftTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryNotFoundSoftTimeoutTimer:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveTuple_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveTuple:");
}

id objc_msgSend_setAddedAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddedAccessory:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAirplayIconView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirplayIconView:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMultipleSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMultipleSelection:");
}

id objc_msgSend_setAllowsRandomVoiceSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsRandomVoiceSelection:");
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSelection:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setAnalyticsPresentationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnalyticsPresentationContext:");
}

id objc_msgSend_setAppearance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppearance:");
}

id objc_msgSend_setApplicationRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationRecord:");
}

id objc_msgSend_setAttributedBodyString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedBodyString:");
}

id objc_msgSend_setAttributedFooterTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedFooterTitle:");
}

id objc_msgSend_setAttributedSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedSubtitle:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAvailableSiriLanguageValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvailableSiriLanguageValues:");
}

id objc_msgSend_setAxesPreservingSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxesPreservingSuperviewLayoutMargins:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundTaskIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundTaskIdentifier:");
}

id objc_msgSend_setBackgroundTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundTintColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBluetoothInterfaceStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBluetoothInterfaceStatus:");
}

id objc_msgSend_setBodyTextView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBodyTextView:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBottomTrayTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomTrayTitle:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBridgedAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBridgedAccessories:");
}

id objc_msgSend_setBridgedAccessoryCategoryToArrayMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBridgedAccessoryCategoryToArrayMap:");
}

id objc_msgSend_setBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuilder:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCameraContainerView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraContainerView:");
}

id objc_msgSend_setCameraInstructionsView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraInstructionsView:");
}

id objc_msgSend_setCameraReader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraReader:");
}

id objc_msgSend_setCameraReaderIsRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraReaderIsRunning:");
}

id objc_msgSend_setCancellationReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancellationReason:");
}

id objc_msgSend_setCardTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCardTime:");
}

id objc_msgSend_setCellContentViewBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCellContentViewBackgroundColor:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setChipDevicePairingUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChipDevicePairingUUID:");
}

id objc_msgSend_setClearButtonMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClearButtonMode:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCodeInputMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCodeInputMethod:");
}

id objc_msgSend_setCommitInProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommitInProgress:");
}

id objc_msgSend_setCommitsAutomatically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommitsAutomatically:");
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfig:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfiguratorDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguratorDelegate:");
}

id objc_msgSend_setConfigurators_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurators:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setConstraintSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstraintSet:");
}

id objc_msgSend_setConstraintsSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstraintsSet:");
}

id objc_msgSend_setContainerView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainerView:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMargins:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setContinueAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContinueAction:");
}

id objc_msgSend_setCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoordinator:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentPairing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentPairing:");
}

id objc_msgSend_setCurrentStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentStep:");
}

id objc_msgSend_setCurrentStepStartTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentStepStartTime:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefaultNameTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultNameTextColor:");
}

id objc_msgSend_setDefaultTextAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultTextAttributes:");
}

id objc_msgSend_setDelayedSetupCodeHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelayedSetupCodeHandler:");
}

id objc_msgSend_setDelaysTouchesBegan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelaysTouchesBegan:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDenylistedAccessoryCategories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDenylistedAccessoryCategories:");
}

id objc_msgSend_setDidShowCustomCommissioningFlowAlertIfNecessary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidShowCustomCommissioningFlowAlertIfNecessary:");
}

id objc_msgSend_setDisableUpdateMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableUpdateMask:");
}

id objc_msgSend_setDiscoveredAccessoryPickerViewControllerDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveredAccessoryPickerViewControllerDelegate:");
}

id objc_msgSend_setDiscoveredAccessoryToPair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoveredAccessoryToPair:");
}

id objc_msgSend_setDismissAccessCodeOnboarding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissAccessCodeOnboarding:");
}

id objc_msgSend_setDismissButtonAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissButtonAction:");
}

id objc_msgSend_setDismissWalletKeyExpressModeOnboarding_forWalletKeyUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissWalletKeyExpressModeOnboarding:forWalletKeyUUID:");
}

id objc_msgSend_setDismissalType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalType:");
}

id objc_msgSend_setDismissedAudioAnalysisOnboardingOnThisDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissedAudioAnalysisOnboardingOnThisDevice:");
}

id objc_msgSend_setDismissedWalletKeyUWBUnlockOnboardingWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissedWalletKeyUWBUnlockOnboardingWithCompletion:");
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEdgesForExtendedLayout:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditing:");
}

id objc_msgSend_setEnableBluetoothAndWiFiAlertController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableBluetoothAndWiFiAlertController:");
}

id objc_msgSend_setEnableIdentifyVoice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableIdentifyVoice:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnabledServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabledServices:");
}

id objc_msgSend_setEnablementConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnablementConfiguration:");
}

id objc_msgSend_setEnablementFlowConfigurationProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnablementFlowConfigurationProvider:");
}

id objc_msgSend_setEngineOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEngineOptions:");
}

id objc_msgSend_setErrorHandlingStrategy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorHandlingStrategy:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setExitCardString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExitCardString:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFooterTitle:");
}

id objc_msgSend_setFootnote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFootnote:");
}

id objc_msgSend_setFootnoteLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFootnoteLabel:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFrozen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrozen:");
}

id objc_msgSend_setFrozenServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrozenServices:");
}

id objc_msgSend_setGridHeightConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGridHeightConstraint:");
}

id objc_msgSend_setGridViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGridViewController:");
}

id objc_msgSend_setGuestsTableVC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGuestsTableVC:");
}

id objc_msgSend_setHasCompletedSiriSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasCompletedSiriSetup:");
}

id objc_msgSend_setHeaderTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderTitle:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesAddAutomationItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesAddAutomationItem:");
}

id objc_msgSend_setHidesCustomTriggers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesCustomTriggers:");
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesWhenStopped:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHome:");
}

id objc_msgSend_setHomeKeyLiveRenderType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHomeKeyLiveRenderType:");
}

id objc_msgSend_setHomePodChime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHomePodChime:");
}

id objc_msgSend_setHomeProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHomeProvider:");
}

id objc_msgSend_setHuisDismissDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHuisDismissDate:");
}

id objc_msgSend_setHuisLaunchDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHuisLaunchDate:");
}

id objc_msgSend_setHuisLaunchReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHuisLaunchReason:");
}

id objc_msgSend_setHuisLaunchType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHuisLaunchType:");
}

id objc_msgSend_setHuisUserType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHuisUserType:");
}

id objc_msgSend_setIconContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconContentMode:");
}

id objc_msgSend_setIconSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconSize:");
}

id objc_msgSend_setIdentifyPeopleFeature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifyPeopleFeature:");
}

id objc_msgSend_setIdleTimerAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerAssertion:");
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setIndexPathOfFirstResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIndexPathOfFirstResponder:");
}

id objc_msgSend_setInitialHomePodChimeState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialHomePodChimeState:");
}

id objc_msgSend_setInterruptionLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionLabel:");
}

id objc_msgSend_setIsCleaningUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCleaningUp:");
}

id objc_msgSend_setIsExplicitContentAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsExplicitContentAllowed:");
}

id objc_msgSend_setIsLaunchedToSetupASpecificAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLaunchedToSetupASpecificAccessory:");
}

id objc_msgSend_setIsPlaybackInfluencesForYouEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPlaybackInfluencesForYouEnabled:");
}

id objc_msgSend_setIsPreloaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPreloaded:");
}

id objc_msgSend_setIsReadyToPair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsReadyToPair:");
}

id objc_msgSend_setIsShareSiriAnalyticsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsShareSiriAnalyticsEnabled:");
}

id objc_msgSend_setIsUsingCHIPCommunicationProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsingCHIPCommunicationProtocol:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setItemsAreEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemsAreEditable:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLaunchReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchReason:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLeadingKeylineLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeadingKeylineLayer:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLeftView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftView:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineFragmentPadding:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setLinkedApplicationItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkedApplicationItem:");
}

id objc_msgSend_setListOfVoices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListOfVoices:");
}

id objc_msgSend_setLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoaded:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocalizedLanguageToLanguageCodeMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalizedLanguageToLanguageCodeMap:");
}

id objc_msgSend_setMargin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMargin:");
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMask:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMatterDeviceSetupRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatterDeviceSetupRequest:");
}

id objc_msgSend_setMatterSetupPairingWindowReadyFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatterSetupPairingWindowReadyFuture:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMinimumIntegerDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumIntegerDigits:");
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumScaleFactor:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setMvvmController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMvvmController:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNearFieldReaderSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNearFieldReaderSession:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNetworkInterfacePowerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkInterfacePowerState:");
}

id objc_msgSend_setNfcAvailableFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcAvailableFuture:");
}

id objc_msgSend_setNfcBodyLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcBodyLabel:");
}

id objc_msgSend_setNfcIconView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcIconView:");
}

id objc_msgSend_setNfcManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcManager:");
}

id objc_msgSend_setNfcTitleLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNfcTitleLabel:");
}

id objc_msgSend_setNumPairedAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumPairedAccessories:");
}

id objc_msgSend_setNumberOfDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfDigits:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOn:");
}

id objc_msgSend_setOnboardingSelections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOnboardingSelections:");
}

id objc_msgSend_setOptionalAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptionalAction:");
}

id objc_msgSend_setOutputObjectTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputObjectTypes:");
}

id objc_msgSend_setOverallSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverallSession:");
}

id objc_msgSend_setOverrideHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideHome:");
}

id objc_msgSend_setPINCodeLengthMax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPINCodeLengthMax:");
}

id objc_msgSend_setPINCodeLengthMin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPINCodeLengthMin:");
}

id objc_msgSend_setPage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPage:");
}

id objc_msgSend_setPairingBeginDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingBeginDate:");
}

id objc_msgSend_setPairingCompleteDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingCompleteDate:");
}

id objc_msgSend_setPairingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingError:");
}

id objc_msgSend_setPairingFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingFuture:");
}

id objc_msgSend_setPairingManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingManager:");
}

id objc_msgSend_setPairingObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingObserver:");
}

id objc_msgSend_setPairingObservers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingObservers:");
}

id objc_msgSend_setPairingState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingState:");
}

id objc_msgSend_setPairingSuccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingSuccess:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase:");
}

id objc_msgSend_setPhaseStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhaseStartDate:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPower_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPower:error:");
}

id objc_msgSend_setPowerState_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerState:completion:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setPrefersSideBySideTextAndSecondaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrefersSideBySideTextAndSecondaryText:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProxNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxNavigationController:");
}

id objc_msgSend_setPunchoutRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPunchoutRequest:");
}

id objc_msgSend_setRawSetupPayloadString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRawSetupPayloadString:");
}

id objc_msgSend_setRecognitionLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecognitionLanguage:");
}

id objc_msgSend_setRecognitionLanguages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecognitionLanguages:");
}

id objc_msgSend_setReservedLayoutSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReservedLayoutSize:");
}

id objc_msgSend_setResumeSetupHomeUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResumeSetupHomeUUIDString:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRightBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:animated:");
}

id objc_msgSend_setRoomBuilderItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRoomBuilderItem:");
}

id objc_msgSend_setRoomName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRoomName:");
}

id objc_msgSend_setRoomProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRoomProvider:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setScanCodeBodyLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanCodeBodyLabel:");
}

id objc_msgSend_setScanCodeIconView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanCodeIconView:");
}

id objc_msgSend_setScanCodeTitleLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanCodeTitleLabel:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelectedPartnerHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedPartnerHome:");
}

id objc_msgSend_setSelectedPartnerRoom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedPartnerRoom:");
}

id objc_msgSend_setSelectedTextRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedTextRange:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSemanticContentAttribute:");
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorColor:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceLikeBuilder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceLikeBuilder:");
}

id objc_msgSend_setServiceNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceNames:");
}

id objc_msgSend_setServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServices:");
}

id objc_msgSend_setSetupAccessoryDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupAccessoryDescription:");
}

id objc_msgSend_setSetupCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupCode:");
}

id objc_msgSend_setSetupResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupResult:");
}

id objc_msgSend_setShouldHideCompactBackgroundCardView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldHideCompactBackgroundCardView:");
}

id objc_msgSend_setShouldIgnoreFutureAccessorySelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreFutureAccessorySelection:");
}

id objc_msgSend_setShouldShowSiriRecognitionLanguageSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowSiriRecognitionLanguageSetup:");
}

id objc_msgSend_setShouldShowVoiceSelectionSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowVoiceSelectionSetup:");
}

id objc_msgSend_setShouldSkipVoiceProfileSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSkipVoiceProfileSetup:");
}

id objc_msgSend_setShouldUseProxCardPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldUseProxCardPresentationStyle:");
}

id objc_msgSend_setShowDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowDescription:");
}

id objc_msgSend_setShowNaturalLightingItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowNaturalLightingItem:");
}

id objc_msgSend_setShowsIcons_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsIcons:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSiriIconContainerView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiriIconContainerView:");
}

id objc_msgSend_setSiriIconImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiriIconImageView:");
}

id objc_msgSend_setSiriOrbContainerView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiriOrbContainerView:");
}

id objc_msgSend_setSiriOrbView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSiriOrbView:");
}

id objc_msgSend_setSpeakerIconImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpeakerIconImageView:");
}

id objc_msgSend_setSpinnerView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpinnerView:");
}

id objc_msgSend_setStagedCHIPPairingIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagedCHIPPairingIdentifier:");
}

id objc_msgSend_setStagingRequestUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagingRequestUUID:");
}

id objc_msgSend_setStateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateMachine:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setStatusDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusDescription:");
}

id objc_msgSend_setStatusTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusTitle:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSupportsBTLE_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsBTLE:");
}

id objc_msgSend_setSupportsIP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsIP:");
}

id objc_msgSend_setSupportsThread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsThread:");
}

id objc_msgSend_setSupportsWAC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsWAC:");
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableFooterView:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextFieldPlaceholderText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextFieldPlaceholderText:");
}

id objc_msgSend_setTextFieldText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextFieldText:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTip:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setTitleString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleString:");
}

id objc_msgSend_setTopAccessoryTuple_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopAccessoryTuple:");
}

id objc_msgSend_setTraditionalDoorbellChime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTraditionalDoorbellChime:");
}

id objc_msgSend_setTrailingKeylineLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrailingKeylineLayer:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUseMonospacedFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseMonospacedFont:");
}

id objc_msgSend_setUseProxSetupPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseProxSetupPresentationStyle:");
}

id objc_msgSend_setUserAutoJoinDisabled_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAutoJoinDisabled:error:");
}

id objc_msgSend_setUserDidSelectAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserDidSelectAccessories:");
}

id objc_msgSend_setUserGivenAccessoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserGivenAccessoryName:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserPinCode_forUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserPinCode:forUser:");
}

id objc_msgSend_setWantsPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsPreferredContentSize:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settings");
}

id objc_msgSend_setupAccessoryDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAccessoryDescription");
}

id objc_msgSend_setupAccessoryPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAccessoryPayload");
}

id objc_msgSend_setupCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCode");
}

id objc_msgSend_setupDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDescription");
}

id objc_msgSend_setupDevice_home_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDevice:home:completion:");
}

id objc_msgSend_setupPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPayload");
}

id objc_msgSend_setupPayloadURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPayloadURL");
}

id objc_msgSend_setupResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupResult");
}

id objc_msgSend_setupSpecificAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSpecificAccessory");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedDispatcher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDispatcher");
}

id objc_msgSend_sharedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHandler");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedLogger");
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPreferences");
}

id objc_msgSend_sharingDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharingDevice");
}

id objc_msgSend_sharingFrameworkClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharingFrameworkClient");
}

id objc_msgSend_shouldIgnoreFutureAccessorySelection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldIgnoreFutureAccessorySelection");
}

id objc_msgSend_shouldScanNetworks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldScanNetworks");
}

id objc_msgSend_shouldShowButtonLinkToHomeApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowButtonLinkToHomeApp");
}

id objc_msgSend_shouldShowDeviceWithUUID_vendorID_productID_serialNumber_rootPublicKey_nodeID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowDeviceWithUUID:vendorID:productID:serialNumber:rootPublicKey:nodeID:");
}

id objc_msgSend_shouldShowSiriRecognitionLanguageSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowSiriRecognitionLanguageSetup");
}

id objc_msgSend_shouldShowVoiceSelectionSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowVoiceSelectionSetup");
}

id objc_msgSend_shouldSkip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSkip");
}

id objc_msgSend_shouldSkipForAccessory_inHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSkipForAccessory:inHome:");
}

id objc_msgSend_shouldSkipStep_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSkipStep:withConfiguration:");
}

id objc_msgSend_shouldSkipVoiceProfileSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSkipVoiceProfileSetup");
}

id objc_msgSend_showActivityIndicatorWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showActivityIndicatorWithStatus:");
}

id objc_msgSend_showCustomCommissioningFlowAlertIfNecessaryForPayload_onViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCustomCommissioningFlowAlertIfNecessaryForPayload:onViewController:");
}

id objc_msgSend_siriDataSharingOptInStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriDataSharingOptInStatus");
}

id objc_msgSend_siriEnabledAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriEnabledAccessories");
}

id objc_msgSend_siriEndpointAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriEndpointAccessories");
}

id objc_msgSend_siriIconImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriIconImageView");
}

id objc_msgSend_siriOrbView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriOrbView");
}

id objc_msgSend_siriPhraseOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriPhraseOptions");
}

id objc_msgSend_siriPrivacyURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriPrivacyURL");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_snapshotWithPass_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotWithPass:completion:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedLockAccessoryArrayForSetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedLockAccessoryArrayForSetup:");
}

id objc_msgSend_speakerIconImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakerIconImageView");
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spinner");
}

id objc_msgSend_spinnerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spinnerView");
}

id objc_msgSend_stageCHIPAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageCHIPAccessory");
}

id objc_msgSend_stageCHIPAccessoryPairingInStepsWithPayload_delegate_scanningNetworks_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageCHIPAccessoryPairingInStepsWithPayload:delegate:scanningNetworks:completionHandler:");
}

id objc_msgSend_stagedCHIPPairingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagedCHIPPairingIdentifier");
}

id objc_msgSend_stagingRequestUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingRequestUUID");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startPairingWithHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPairingWithHome:");
}

id objc_msgSend_startPollingWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPollingWithError:");
}

id objc_msgSend_startProxCardTransactionWithOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startProxCardTransactionWithOptions:completion:");
}

id objc_msgSend_startReaderSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startReaderSession:");
}

id objc_msgSend_startSearchingForNewAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSearchingForNewAccessories");
}

id objc_msgSend_startWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithError:");
}

id objc_msgSend_startWithHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithHome:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachine");
}

id objc_msgSend_stateMachineConfiguration_didUpdateHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfiguration:didUpdateHome:");
}

id objc_msgSend_stateMachineConfigurationActiveTupleIsTopTuple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationActiveTupleIsTopTuple");
}

id objc_msgSend_stateMachineConfigurationGetDiscoveredAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationGetDiscoveredAccessory:");
}

id objc_msgSend_stateMachineConfigurationGetLaunchReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationGetLaunchReason:");
}

id objc_msgSend_stateMachineConfigurationGetMatterDeviceSetupRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationGetMatterDeviceSetupRequest:");
}

id objc_msgSend_stateMachineConfigurationGetSetupAccessoryDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationGetSetupAccessoryDescription:");
}

id objc_msgSend_stateMachineConfigurationGetSetupCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationGetSetupCode:");
}

id objc_msgSend_stateMachineConfigurationIsLaunchedToSetupMultipleAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:");
}

id objc_msgSend_stateMachineConfigurationIsLaunchedToSetupSpecificAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationIsLaunchedToSetupSpecificAccessory:");
}

id objc_msgSend_stateMachineConfigurationIsReadyToPair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationIsReadyToPair:");
}

id objc_msgSend_stateMachineConfigurationShouldJumpToDoneStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldJumpToDoneStep:");
}

id objc_msgSend_stateMachineConfigurationShouldSetupBridgedAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSetupBridgedAccessories:");
}

id objc_msgSend_stateMachineConfigurationShouldSetupRouters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSetupRouters:");
}

id objc_msgSend_stateMachineConfigurationShouldSkipAccessoryUpdateStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSkipAccessoryUpdateStep:");
}

id objc_msgSend_stateMachineConfigurationShouldSkipBridgeAddedStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSkipBridgeAddedStep:");
}

id objc_msgSend_stateMachineConfigurationShouldSkipDetectedStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSkipDetectedStep:");
}

id objc_msgSend_stateMachineConfigurationShouldSkipDoneStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSkipDoneStep:");
}

id objc_msgSend_stateMachineConfigurationShouldSkipHomeHubStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSkipHomeHubStep:");
}

id objc_msgSend_stateMachineConfigurationShouldSkipHomeHubUpgradeStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSkipHomeHubUpgradeStep:");
}

id objc_msgSend_stateMachineConfigurationShouldSkipResumeSelectAccessoryStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineConfigurationShouldSkipResumeSelectAccessoryStep:");
}

id objc_msgSend_staticViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "staticViewControllers");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusDescription");
}

id objc_msgSend_statusTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusTitle");
}

id objc_msgSend_stepFollowingStep_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stepFollowingStep:withConfiguration:");
}

id objc_msgSend_stepRequiresDismissalConfirmation_withCoordinator_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stepRequiresDismissalConfirmation:withCoordinator:configuration:");
}

id objc_msgSend_stepRequiresIdentifyButton_withCoordinator_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stepRequiresIdentifyButton:withCoordinator:configuration:");
}

id objc_msgSend_stepToStringMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stepToStringMap");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stopSearchingForNewAccessoriesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSearchingForNewAccessoriesWithError:");
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeID");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByApplyingCodeFormatToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByApplyingCodeFormatToString:");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForHSProxCardSetupUIStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForHSProxCardSetupUIStep:");
}

id objc_msgSend_stringForObjectValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForObjectValue:");
}

id objc_msgSend_stringToStepMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringToStepMap");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "style");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitle");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_suggestedAccessoryName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedAccessoryName");
}

id objc_msgSend_suggestedNamesForServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedNamesForServices:");
}

id objc_msgSend_suggestedRoom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedRoom");
}

id objc_msgSend_suggestedRoomUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedRoomUUID");
}

id objc_msgSend_suggestedRoomUniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedRoomUniqueIdentifier");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_supportedFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedFeatures");
}

id objc_msgSend_supportsAccessCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsAccessCodes");
}

id objc_msgSend_supportsBTLE(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBTLE");
}

id objc_msgSend_supportsCHIP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCHIP");
}

id objc_msgSend_supportsIP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsIP");
}

id objc_msgSend_supportsOnboarding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsOnboarding");
}

id objc_msgSend_supportsRichConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRichConfiguration");
}

id objc_msgSend_supportsThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsThread");
}

id objc_msgSend_supportsUWBUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsUWBUnlock");
}

id objc_msgSend_supportsWAC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWAC");
}

id objc_msgSend_supportsWalletKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWalletKey");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGray2Color(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGray2Color");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGroupedBackgroundColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemIndigoColor");
}

id objc_msgSend_systemLightMidGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLightMidGrayColor");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemYellowColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_tableView_didSelectRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView:didSelectRowAtIndexPath:");
}

id objc_msgSend_tableView_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView:numberOfRowsInSection:");
}

id objc_msgSend_tableViewManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableViewManager");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tag");
}

id objc_msgSend_targetEcosystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetEcosystem");
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teamIdentifier");
}

id objc_msgSend_televisionProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "televisionProfiles");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textColor");
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textContainer");
}

id objc_msgSend_textDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textDidChange:");
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textField");
}

id objc_msgSend_textFieldMinimumHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textFieldMinimumHeight");
}

id objc_msgSend_textFieldText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textFieldText");
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textRangeFromPosition:toPosition:");
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threadIdentifier");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tintColor");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleForAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForAccessory");
}

id objc_msgSend_titleForAccessoryWithDefaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForAccessoryWithDefaultValue:");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_toggleCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleCamera");
}

id objc_msgSend_topAccessoryTuple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAccessoryTuple");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_topology(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topology");
}

id objc_msgSend_traditionalChimeFeature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traditionalChimeFeature");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_trailingKeylineLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingKeylineLayer");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueHomeKitNameForName_allNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueHomeKitNameForName:allNames:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateAccessoriesPendingConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAccessoriesPendingConfiguration:");
}

id objc_msgSend_updateAccessoryCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAccessoryCategory:");
}

id objc_msgSend_updateAccessoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAccessoryName:");
}

id objc_msgSend_updateAssistantAccessControl_forHome_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAssistantAccessControl:forHome:completionHandler:");
}

id objc_msgSend_updateAudioAnalysisClassifierOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAudioAnalysisClassifierOptions:completion:");
}

id objc_msgSend_updateAudioAnalysisUserDropinAccessLevel_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAudioAnalysisUserDropinAccessLevel:completionHandler:");
}

id objc_msgSend_updateCell_forItem_indexPath_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCell:forItem:indexPath:animated:");
}

id objc_msgSend_updateDidOnboardAudioAnalysis_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDidOnboardAudioAnalysis:completion:");
}

id objc_msgSend_updateHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHome:");
}

id objc_msgSend_updateName_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateName:completionHandler:");
}

id objc_msgSend_updatePairingStatus_phase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePairingStatus:phase:");
}

id objc_msgSend_updatePendingConfigurationIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePendingConfigurationIdentifier:completionHandler:");
}

id objc_msgSend_updatePreferredContentSizeForCardWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePreferredContentSizeForCardWidth:");
}

id objc_msgSend_updateRetry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRetry:");
}

id objc_msgSend_updateSetupAccessoryDescriptionWithPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSetupAccessoryDescriptionWithPayload:");
}

id objc_msgSend_updateSetupPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSetupPayload:");
}

id objc_msgSend_updateStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStatus:error:");
}

id objc_msgSend_updateUIWithService_suggestedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUIWithService:suggestedName:");
}

id objc_msgSend_updateUIWithServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUIWithServiceType:");
}

id objc_msgSend_updateUIWithTuple_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUIWithTuple:");
}

id objc_msgSend_updateUserGivenAccessoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUserGivenAccessoryName:");
}

id objc_msgSend_updateWithIconDescriptor_displayStyle_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithIconDescriptor:displayStyle:animated:");
}

id objc_msgSend_updateWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithOptions:");
}

id objc_msgSend_updateWithSetupAccessoryPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithSetupAccessoryPayload:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_urlComponentHomeSettingsForAccessory_forHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlComponentHomeSettingsForAccessory:forHome:");
}

id objc_msgSend_useSiriAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useSiriAction");
}

id objc_msgSend_useWLANInsteadOfWiFi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useWLANInsteadOfWiFi");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "user");
}

id objc_msgSend_userAutoJoinDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAutoJoinDisabled");
}

id objc_msgSend_userDidRespondToConsentRequestForSetupAccessoryDescription_withResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDidRespondToConsentRequestForSetupAccessoryDescription:withResponse:");
}

id objc_msgSend_userDidSelectAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDidSelectAccessories");
}

id objc_msgSend_userFacingStringForItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userFacingStringForItem:");
}

id objc_msgSend_userFriendlyAccessoryLocalizedCapitalizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userFriendlyAccessoryLocalizedCapitalizedDescription");
}

id objc_msgSend_userGivenAccessoryName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userGivenAccessoryName");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_userLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userLabel");
}

id objc_msgSend_userManagementDidFinishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userManagementDidFinishWithError:");
}

id objc_msgSend_userManagementDidLoad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userManagementDidLoad");
}

id objc_msgSend_userSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSettings");
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "users");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_validateDeviceCredential_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateDeviceCredential:completionHandler:");
}

id objc_msgSend_validateName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateName:");
}

id objc_msgSend_validateNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateNames:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorID");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewController_didFinishWithConfigurationResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewController:didFinishWithConfigurationResults:");
}

id objc_msgSend_viewControllerForCoordinator_config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForCoordinator:config:");
}

id objc_msgSend_viewControllerForCoordinator_step_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForCoordinator:step:");
}

id objc_msgSend_viewControllerWillAppear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerWillAppear:");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleCells");
}

id objc_msgSend_voiceInfoFromSettingLanguageValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceInfoFromSettingLanguageValue:");
}

id objc_msgSend_voiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceName");
}

id objc_msgSend_voiceNamesForOutputLanguageCode_gender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceNamesForOutputLanguageCode:gender:");
}

id objc_msgSend_voiceSelectionAllowsRandomSelection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceSelectionAllowsRandomSelection");
}

id objc_msgSend_walletAppFromAppStoreURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walletAppFromAppStoreURL");
}

id objc_msgSend_walletAppIconImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walletAppIconImageView");
}

id objc_msgSend_walletAppURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walletAppURL");
}

id objc_msgSend_walletKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walletKey");
}

id objc_msgSend_walletKeyDeviceState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walletKeyDeviceState");
}

id objc_msgSend_walletKeyIconDescriptorForHome_shouldUseKeyholeAsset_foriPhoneDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walletKeyIconDescriptorForHome:shouldUseKeyholeAsset:foriPhoneDevice:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_wellCornerRadiusForNumberOfDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wellCornerRadiusForNumberOfDigits:");
}

id objc_msgSend_wellSizeForNumberOfDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wellSizeForNumberOfDigits:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_wifiInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiInterface");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_writeConfigurationState_toService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeConfigurationState:toService:");
}

id objc_msgSend_writeVisibilityState_toInputSourceService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeVisibilityState:toInputSourceService:");
}
