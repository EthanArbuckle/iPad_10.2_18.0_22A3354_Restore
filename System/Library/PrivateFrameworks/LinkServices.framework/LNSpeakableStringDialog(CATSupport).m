@implementation LNSpeakableStringDialog(CATSupport)

- (void)getResultWithCompletionHandler:()CATSupport
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSpeakableStringDialog+CATSupport.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v23 = CFSTR("locale");
  objc_msgSend(a1, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v8 = (void *)getCATClass_softClass_464;
  v22 = getCATClass_softClass_464;
  v9 = MEMORY[0x1E0C809B0];
  if (!getCATClass_softClass_464)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getCATClass_block_invoke_465;
    v18[3] = &unk_1E45DDB30;
    v18[4] = &v19;
    __getCATClass_block_invoke_465((uint64_t)v18);
    v8 = (void *)v20[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(a1, "parametersXML");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeXML");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __70__LNSpeakableStringDialog_CATSupport__getResultWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E45DCC58;
  v17 = v5;
  v13 = v5;
  LODWORD(v15) = 0;
  objc_msgSend(v10, "execute:paramsXML:localeXML:parameters:globals:callback:options:completion:", 0, v11, v12, MEMORY[0x1E0C9AA70], v7, 0, v15, v16);

}

- (id)localeXML
{
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
  void *v25;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend(a1, "fullSpeakableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ln_stringByEscapingForXML");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fullSpeakableString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spoken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ln_stringByEscapingForXML");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "supportingSpeakableString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "printed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForLocaleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ln_stringByEscapingForXML");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "supportingSpeakableString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "spoken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForLocaleIdentifier:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ln_stringByEscapingForXML");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<full><print>%@</print><speak>%@</speak></full><supporting><print>%@</print><speak>%@</speak></supporting>"), v6, v11, v16, v21);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<print>%@</print><speak>%@</speak>"), v6, v11, v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "localeIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<cat xmlns=\"urn:apple:names:siri:cat:1.0\" locale=\"%@\">\n<all>\n<dialog>%@</dialog>\n</all>\n</cat>\n"), v24, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (uint64_t)parametersXML
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<cat xmlns=\"urn:apple:names:siri:cat:1.0\">\n<parameters>\n</parameters>\n</cat>\n"));
}

@end
