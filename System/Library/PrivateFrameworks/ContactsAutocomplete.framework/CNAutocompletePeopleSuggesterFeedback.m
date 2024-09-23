@implementation CNAutocompletePeopleSuggesterFeedback

- (CNAutocompletePeopleSuggesterFeedback)init
{
  CNAutocompletePeopleSuggesterFeedback *v2;
  void *v3;
  uint64_t v4;
  NSString *bundleIdentifier;
  _PSSuggester *v6;
  _PSSuggester *psSuggester;
  CNAutocompletePeopleSuggesterFeedback *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNAutocompletePeopleSuggesterFeedback;
  v2 = -[CNAutocompletePeopleSuggesterFeedback init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)v4;

    v6 = (_PSSuggester *)objc_alloc_init(get_PSSuggesterClass_0());
    psSuggester = v2->_psSuggester;
    v2->_psSuggester = v6;

    v8 = v2;
  }

  return v2;
}

+ (void)didReceiveSuggestions:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  Class v6;
  void *v7;
  id v8;

  v4 = (Class (__cdecl *)())get_PSCNAutocompleteFeedbackClass;
  v5 = a3;
  v6 = v4();
  objc_msgSend(a1, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createVendedSuggestionsFeedbackWithBundleIdentifier:suggestions:](v6, "createVendedSuggestionsFeedbackWithBundleIdentifier:suggestions:", v7, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v8);
}

+ (void)userSelectedSuggestion:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  Class v6;
  void *v7;
  id v8;

  v4 = (Class (__cdecl *)())get_PSCNAutocompleteFeedbackClass;
  v5 = a3;
  v6 = v4();
  objc_msgSend(a1, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createTappedSuggestionFeedbackWithBundleIdentifier:suggestion:](v6, "createTappedSuggestionFeedbackWithBundleIdentifier:suggestion:", v7, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v8);
}

+ (void)userEnteredNewSession
{
  Class PSCNAutocompleteFeedbackClass;
  void *v4;
  id v5;

  PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createEnteredFeedbackWithBundleIdentifier:status:](PSCNAutocompleteFeedbackClass, "createEnteredFeedbackWithBundleIdentifier:status:", v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v5);
}

+ (void)userEnteredExistingSession
{
  Class PSCNAutocompleteFeedbackClass;
  void *v4;
  id v5;

  PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createEnteredFeedbackWithBundleIdentifier:status:](PSCNAutocompleteFeedbackClass, "createEnteredFeedbackWithBundleIdentifier:status:", v4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v5);
}

+ (void)userNavigatedAwayFromSession
{
  Class PSCNAutocompleteFeedbackClass;
  void *v4;
  id v5;

  PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createExitedFeedbackWithBundleIdentifier:status:](PSCNAutocompleteFeedbackClass, "createExitedFeedbackWithBundleIdentifier:status:", v4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v5);
}

+ (void)userTerminatedSession
{
  Class PSCNAutocompleteFeedbackClass;
  void *v4;
  id v5;

  PSCNAutocompleteFeedbackClass = get_PSCNAutocompleteFeedbackClass();
  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createExitedFeedbackWithBundleIdentifier:status:](PSCNAutocompleteFeedbackClass, "createExitedFeedbackWithBundleIdentifier:status:", v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v5);
}

+ (void)userEnteredContact:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  Class v6;
  void *v7;
  id v8;

  v4 = get_PSCNAutocompleteFeedbackClass;
  v5 = a3;
  v6 = v4();
  objc_msgSend(a1, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createTypedHandleFeedbackWithBundleIdentifier:contact:viaContactPicker:](v6, "createTypedHandleFeedbackWithBundleIdentifier:contact:viaContactPicker:", v7, v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v8);
}

+ (void)userSelectedFromContactPicker:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  Class v6;
  void *v7;
  id v8;

  v4 = get_PSCNAutocompleteFeedbackClass;
  v5 = a3;
  v6 = v4();
  objc_msgSend(a1, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createTypedHandleFeedbackWithBundleIdentifier:contact:viaContactPicker:](v6, "createTypedHandleFeedbackWithBundleIdentifier:contact:viaContactPicker:", v7, v5, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v8);
}

+ (void)userRemovedContact:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  Class v6;
  void *v7;
  id v8;

  v4 = get_PSCNAutocompleteFeedbackClass;
  v5 = a3;
  v6 = v4();
  objc_msgSend(a1, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class createErasedHandleFeedbackWithBundleIdentifier:contact:](v6, "createErasedHandleFeedbackWithBundleIdentifier:contact:", v7, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "provideFeedback:", v8);
}

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_1 != -1)
    dispatch_once(&sharedInstance_cn_once_token_1, &__block_literal_global_12);
  return (id)sharedInstance_cn_once_object_1;
}

void __55__CNAutocompletePeopleSuggesterFeedback_sharedInstance__block_invoke()
{
  CNAutocompletePeopleSuggesterFeedback *v0;
  void *v1;

  v0 = objc_alloc_init(CNAutocompletePeopleSuggesterFeedback);
  v1 = (void *)sharedInstance_cn_once_object_1;
  sharedInstance_cn_once_object_1 = (uint64_t)v0;

}

+ (id)bundleIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)provideFeedback:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "psSuggester");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provideFeedbackForContactsAutocompleteSuggestions:", v3);

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (_PSSuggester)psSuggester
{
  return self->_psSuggester;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psSuggester, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
