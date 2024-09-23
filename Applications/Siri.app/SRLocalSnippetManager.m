@implementation SRLocalSnippetManager

+ (VRXVisualResponseProvider)visualResponseProvider
{
  if (qword_100150420 != -1)
    dispatch_once(&qword_100150420, &stru_100124078);
  return (VRXVisualResponseProvider *)(id)qword_100150418;
}

+ (id)transcriptItemForObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __objc2_class *v10;
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
  _TtC4Siri34SiriUIVisualResponseViewController *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  int v53;
  const char *v54;

  v4 = a3;
  objc_opt_class(SAUISnippet, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    objc_opt_class(SAUIAssistantUtteranceView, v7);
    if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
    {
      v10 = SRServerUtteranceController;
      goto LABEL_12;
    }
    objc_opt_class(SASSpeechRecognized, v12);
    if ((objc_opt_isKindOfClass(v4, v15) & 1) != 0
      || (objc_opt_class(SASSpeechPartialResult, v16), (objc_opt_isKindOfClass(v4, v17) & 1) != 0)
      || (objc_opt_class(SAUIUserUtteranceView, v18), (objc_opt_isKindOfClass(v4, v19) & 1) != 0))
    {
      v10 = SRUserUtteranceViewController;
      goto LABEL_12;
    }
    objc_opt_class(SAUIShowHelp, v20);
    if ((objc_opt_isKindOfClass(v4, v46) & 1) != 0)
    {
LABEL_3:
      v10 = SRGuideViewController;
LABEL_12:
      v21 = (_TtC4Siri34SiriUIVisualResponseViewController *)objc_alloc_init(v10);
      goto LABEL_13;
    }
    objc_opt_class(SAUIButton, v47);
    if ((objc_opt_isKindOfClass(v4, v48) & 1) != 0)
    {
      v10 = SRBigButtonController;
      goto LABEL_12;
    }
    objc_opt_class(SAUIListItem, v49);
    if ((objc_opt_isKindOfClass(v4, v51) & 1) != 0)
    {
      v10 = SRDisambiguationSelectionController;
      goto LABEL_12;
    }
LABEL_36:
    v21 = 0;
    goto LABEL_37;
  }
  objc_opt_class(SAGuidanceGuideSnippet, v7);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
    goto LABEL_3;
  objc_opt_class(SAGuidanceGuideDomainSnippet, v9);
  if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
  {
    v10 = SRGuideDomainViewController;
    goto LABEL_12;
  }
  objc_opt_class(SAUIPluginSnippet, v14);
  if ((objc_opt_isKindOfClass(v4, v23) & 1) == 0)
  {
    objc_opt_class(SAUIVisualResponseSnippet, v24);
    if ((objc_opt_isKindOfClass(v4, v25) & 1) == 0)
      goto LABEL_36;
  }
  v26 = +[SRVisualResponseTransformer visualMode](SRVisualResponseTransformer, "visualMode");
  objc_opt_class(SAUIPluginSnippet, v27);
  if ((objc_opt_isKindOfClass(v4, v28) & 1) != 0)
  {
    v30 = v4;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "visualResponseProvider"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "modelData"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "viewForSnippetModel:bundleName:mode:", v32, v33, v26));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "viewId"));
    objc_msgSend(v34, "setViewId:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "responseViewId"));
    objc_msgSend(v34, "setResponseViewId:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "itemType"));
    LOBYTE(v32) = objc_msgSend(v37, "isEqualToString:", SAAceViewUIItemTypeItemTypeConversationValue);

    if ((v32 & 1) != 0
      || (v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "itemType")),
          v39 = objc_msgSend(v38, "isEqualToString:", SAAceViewUIItemTypeItemTypeHintValue),
          v38,
          v39))
    {
      objc_msgSend(v34, "setVisualResponseLocation:", 2);
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "itemType"));
    v41 = objc_msgSend(v40, "isEqualToString:", SAAceViewUIItemTypeItemTypeAnnouncementValue);

    if (v41)
      objc_msgSend(v34, "setVisualResponseLocation:", 2);
  }
  else
  {
    objc_opt_class(SAUIVisualResponseSnippet, v29);
    if ((objc_opt_isKindOfClass(v4, v42) & 1) == 0)
    {
      objc_msgSend(a1, "_logRFSnippetRenderingContextWithEvent:", 0);
      goto LABEL_31;
    }
    v43 = v4;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "visualResponseProvider"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "modelData"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "viewForModel:mode:", v45, v26));

    v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "viewId"));
    objc_msgSend(v34, "setViewId:", v30);
  }

  objc_msgSend(a1, "_logRFSnippetRenderingContextWithEvent:", 0);
  if (v34)
  {
    v21 = -[SiriUIVisualResponseViewController initWithView:aceObject:]([_TtC4Siri34SiriUIVisualResponseViewController alloc], "initWithView:aceObject:", v34, v4);

    goto LABEL_13;
  }
LABEL_31:
  objc_msgSend(a1, "_logRFSnippetRenderingContextWithEvent:", 1);
  v50 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v53 = 136315138;
    v54 = "+[SRLocalSnippetManager transcriptItemForObject:]";
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s #SRLocalSnippetManager: Failed to create ResponseView from modelData in a SAUISnippet.", (uint8_t *)&v53, 0xCu);
  }
  v21 = 0;
LABEL_13:
  if (!v21)
  {
LABEL_37:
    v22 = 0;
    goto LABEL_38;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SiriSharedUITranscriptItem transcriptItemWithAceObject:](SiriSharedUITranscriptItem, "transcriptItemWithAceObject:", v4));
  objc_msgSend(v22, "setViewController:", v21);
LABEL_38:

  return v22;
}

+ (void)_logRFSnippetRenderingContextWithEvent:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_msgSend(objc_alloc((Class)VRXSnippetRenderingContext), "initWithRenderingEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentInstrumentationTurnContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "turnIdentifier"));

  objc_msgSend(v6, "emitWithTurnIdentifier:", v5);
}

@end
