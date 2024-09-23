@implementation VMMessageTranscriptViewModel

+ (NSURL)neutralFeedbackURL
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("mobile-phone-voicemail-transcription://report-feedback"));
}

+ (NSURL)negativeFeedbackURL
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("mobile-phone-voicemail-transcription://negative"));
}

+ (NSURL)positiveFeedbackURL
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("mobile-phone-voicemail-transcription://positive"));
}

- (VMMessageTranscriptViewModel)initWithMessage:(id)a3
{
  id v4;
  MPVisualTranscriptionMessage *v5;
  void *v6;
  MPVisualTranscriptionMessage *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  VMMessageTranscriptViewModel *v12;

  v4 = a3;
  v5 = [MPVisualTranscriptionMessage alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transcript"));
  v7 = -[MPVisualTranscriptionMessage initWithVMTranscript:](v5, "initWithVMTranscript:", v6);

  v8 = objc_msgSend(v4, "isTranscriptionRated");
  v9 = objc_msgSend(v4, "isTranscribing");
  v10 = objc_msgSend(v4, "wasTranscriptionAttempted");
  v11 = objc_msgSend(v4, "isTranscriptionAvailable");

  v12 = -[VMMessageTranscriptViewModel initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:](self, "initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:", v8, v9, v10, v11, v7);
  return v12;
}

- (VMMessageTranscriptViewModel)initWithDonated:(BOOL)a3 transcribing:(BOOL)a4 transcriptionAttempted:(BOOL)a5 transcriptionAvailable:(BOOL)a6 messageTranscript:(id)a7
{
  id v12;
  VMMessageTranscriptViewModel *v13;
  VMMessageTranscriptViewModel *v14;
  double v15;
  uint64_t v16;
  NSString *messageTranscriptAttributedText;
  objc_super v19;

  v12 = a7;
  v19.receiver = self;
  v19.super_class = (Class)VMMessageTranscriptViewModel;
  v13 = -[VMMessageTranscriptViewModel init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    v13->_donated = a3;
    v13->_transcribing = a4;
    v13->_transcriptionAttempted = a5;
    v13->_transcriptionAvailable = a6;
    if (v12)
    {
      objc_msgSend(v12, "confidence");
      *(float *)&v15 = v15;
      v14->_messageTranscriptConfidence = *(float *)&v15;
      v14->_messageTranscriptConfidenceRating = (unint64_t)objc_msgSend(v12, "confidenceRating");
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributedText"));
      messageTranscriptAttributedText = v14->_messageTranscriptAttributedText;
      v14->_messageTranscriptAttributedText = (NSString *)v16;

    }
  }

  return v14;
}

- (NSAttributedString)localizedAttributedFeedbackText
{
  return (NSAttributedString *)-[VMMessageTranscriptViewModel localizedAttributedFeedbackTextWithLocale:](self, "localizedAttributedFeedbackTextWithLocale:", 0);
}

- (id)localizedAttributedFeedbackTextWithLocale:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel localizedAttributedFeedbackTextForConfidence:locale:](self, "localizedAttributedFeedbackTextForConfidence:locale:", -[VMMessageTranscriptViewModel confidence](self, "confidence"), v4));

  return v5;
}

- (NSAttributedString)localizedAttributedText
{
  return (NSAttributedString *)-[VMMessageTranscriptViewModel localizedAttributedTextForMessage](self, "localizedAttributedTextForMessage");
}

- (NSAttributedString)localizedAttributedTitle
{
  return (NSAttributedString *)-[VMMessageTranscriptViewModel localizedAttributedTitleForConfidence:](self, "localizedAttributedTitleForConfidence:", -[VMMessageTranscriptViewModel confidence](self, "confidence"));
}

- (id)localizedAttributedTextForMessage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;

  v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v3, "setAlignment:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel tintColorForColor:](self, "tintColorForColor:", v5));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, NSForegroundColorAttributeName);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, NSFontAttributeName);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, NSParagraphStyleAttributeName);
  if (-[VMMessageTranscriptViewModel isTranscribing](self, "isTranscribing"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_MESSAGE_TRANSCRIBING");
LABEL_7:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_10007F010, CFSTR("VoicemailUI")));

    v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v12, v4);
    goto LABEL_8;
  }
  if (-[VMMessageTranscriptViewModel transcriptionAttempted](self, "transcriptionAttempted")
    && !-[VMMessageTranscriptViewModel isTranscriptionAvailable](self, "isTranscriptionAvailable"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_MESSAGE_TRANSCRIBE_ERROR");
    goto LABEL_7;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel localizedAttributedTextForConfidence:](self, "localizedAttributedTextForConfidence:", -[VMMessageTranscriptViewModel confidence](self, "confidence")));
LABEL_8:

  return v11;
}

- (unint64_t)confidence
{
  unint64_t result;
  float v4;
  float v5;
  float v6;

  result = -[VMMessageTranscriptViewModel messageTranscriptConfidenceRating](self, "messageTranscriptConfidenceRating");
  if (result - 1 >= 3)
  {
    -[VMMessageTranscriptViewModel messageTranscriptConfidence](self, "messageTranscriptConfidence");
    if (v4 <= PHVoicemailLowQualityConfidenceThresholdForTranscript())
    {
      -[VMMessageTranscriptViewModel messageTranscriptConfidence](self, "messageTranscriptConfidence");
      if (v5 <= PHVoicemailLowQualityConfidenceThresholdForTranscript())
      {
        -[VMMessageTranscriptViewModel messageTranscriptConfidence](self, "messageTranscriptConfidence");
        if (v6 <= PHVoicemailConfidenceThresholdForTranscript())
          return 1;
        else
          return 2;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (id)localizedAttributedFeedbackTextForConfidence:(unint64_t)a3 locale:(id)a4
{
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v43;
  id v44;
  void *v45;

  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(self), "metricsCollectionValidForLocale:", v6);

  if (v7)
  {
    v8 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v10, "setAlignment:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont voicemailFootnoteFont](UIFont, "voicemailFootnoteFont"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, NSFontAttributeName);

    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, NSParagraphStyleAttributeName);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel tintColorForColor:](self, "tintColorForColor:", v12));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, NSForegroundColorAttributeName);

    if (a3 - 2 >= 2)
    {
      if (a3 != 1)
      {
        v33 = 0;
LABEL_12:

        return v33;
      }
      v34 = objc_msgSend((id)objc_opt_class(self), "neutralFeedbackURL");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, NSLinkAttributeName);

      v29 = objc_alloc_init((Class)NSTextAttachment);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage voicemailReportFeedbackGlyphImage](UIImage, "voicemailReportFeedbackGlyphImage"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "imageWithRenderingMode:", 2));

      objc_msgSend(v29, "setImage:", v17);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, NSAttachmentAttributeName);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_CONFIDENCE_NONE"), &stru_10007F010, CFSTR("VoicemailUI")));

      v26 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", &stru_10007F010, v9);
      if (v8 == (id)1)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR(" ")));
        v38 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v31);
        objc_msgSend(v26, "appendAttributedString:", v38);

        v39 = (id)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v29));
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" "), "stringByAppendingString:", v20));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v29));
        objc_msgSend(v26, "appendAttributedString:", v40);

        v39 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v31);
      }
      v41 = v39;
      objc_msgSend(v26, "appendAttributedString:", v39);

      objc_msgSend(v26, "addAttributes:range:", v9, 0, objc_msgSend(v26, "length"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v45 = v9;
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_OPTION_NEGATIVE"), &stru_10007F010, CFSTR("VoicemailUI")));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_OPTION_POSITIVE"), &stru_10007F010, CFSTR("VoicemailUI")));

      v44 = v10;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_FEEDBACK_WITH_OPTIONS_%_OR_%"), &stru_10007F010, CFSTR("VoicemailUI")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v17, v15));

      v43 = objc_msgSend(v20, "rangeOfString:", v15);
      v22 = v21;
      v23 = objc_msgSend(v20, "rangeOfString:", v17);
      v25 = v24;
      v26 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v20, v45);
      v27 = objc_msgSend((id)objc_opt_class(self), "positiveFeedbackURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      objc_msgSend(v26, "addAttribute:value:range:", NSLinkAttributeName, v28, v23, v25);

      v29 = (id)v15;
      v9 = v45;
      v30 = objc_msgSend((id)objc_opt_class(self), "neutralFeedbackURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = v22;
      v10 = v44;
      objc_msgSend(v26, "addAttribute:value:range:", NSLinkAttributeName, v31, v43, v32);
    }

    v33 = objc_msgSend(v26, "copy");
    goto LABEL_12;
  }
  v33 = 0;
  return v33;
}

- (id)localizedAttributedTextForConfidence:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel tintColorForColor:](self, "tintColorForColor:", v6));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, NSForegroundColorAttributeName);

  if (a3 - 2 >= 2)
  {
    if (a3 != 1)
    {
      v16 = 0;
      goto LABEL_7;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_MESSAGE_CONFIDENCE_NONE"), &stru_10007F010, CFSTR("VoicemailUI")));

    v11 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v11, "setAlignment:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, NSFontAttributeName);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, NSParagraphStyleAttributeName);
    v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v9, v5);
  }
  else
  {
    v8 = PHVoicemailTranscriptAttributedPrefix();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = PHVoicemailTranscriptAttributedSuffix();
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel messageTranscriptAttributedText](self, "messageTranscriptAttributedText"));
    v13 = objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "insertAttributedString:atIndex:", v9, 0);
    objc_msgSend(v13, "appendAttributedString:", v11);
    v14 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v9, "size");
    objc_msgSend(v14, "setHeadIndent:");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortFont](UIFont, "telephonyUIBodyShortFont"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, NSFontAttributeName);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, NSParagraphStyleAttributeName);
    objc_msgSend(v13, "addAttributes:range:", v5, 0, objc_msgSend(v13, "length"));
    v16 = objc_msgSend(v13, "copy");

  }
LABEL_7:

  return v16;
}

- (id)localizedAttributedTitleForConfidence:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortEmphasizedFont](UIFont, "telephonyUIBodyShortEmphasizedFont"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, NSFontAttributeName);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel tintColorForColor:](self, "tintColorForColor:", v7));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, NSForegroundColorAttributeName);

  if (a3 == 3)
  {
    v9 = objc_alloc((Class)NSAttributedString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_TITLE");
  }
  else
  {
    if (a3 != 2)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v9 = objc_alloc((Class)NSAttributedString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("VOICEMAILUI_MESSAGE_TRANSCRIPT_VIEW_TITLE_CONFIDENCE_LOW");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_10007F010, CFSTR("VoicemailUI")));
  v14 = objc_msgSend(v9, "initWithString:attributes:", v13, v5);

LABEL_7:
  return v14;
}

- (id)tintColorForColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageTranscriptViewModel tintColorDelegate](self, "tintColorDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_accessibilityHigherContrastTintColorForColor:", v4));
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

+ (BOOL)metricsCollectionValidForLocale:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (!v3)
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "regionCode"));
  v5 = objc_msgSend(TULVMRegionsWithoutMetrics, "containsObject:", v4) ^ 1;

  return v5;
}

- (BOOL)donated
{
  return self->_donated;
}

- (BOOL)isTranscribing
{
  return self->_transcribing;
}

- (void)setTranscribing:(BOOL)a3
{
  self->_transcribing = a3;
}

- (BOOL)transcriptionAttempted
{
  return self->_transcriptionAttempted;
}

- (void)setTranscriptionAttempted:(BOOL)a3
{
  self->_transcriptionAttempted = a3;
}

- (BOOL)isTranscriptionAvailable
{
  return self->_transcriptionAvailable;
}

- (void)setTranscriptionAvailable:(BOOL)a3
{
  self->_transcriptionAvailable = a3;
}

- (UIView)tintColorDelegate
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_tintColorDelegate);
}

- (void)setTintColorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tintColorDelegate, a3);
}

- (float)messageTranscriptConfidence
{
  return self->_messageTranscriptConfidence;
}

- (unint64_t)messageTranscriptConfidenceRating
{
  return self->_messageTranscriptConfidenceRating;
}

- (NSString)messageTranscriptAttributedText
{
  return self->_messageTranscriptAttributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTranscriptAttributedText, 0);
  objc_destroyWeak((id *)&self->_tintColorDelegate);
}

- (VMMessageTranscriptViewModel)initWithMPMessage:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  VMMessageTranscriptViewModel *v10;

  swift_unknownObjectRetain(a3);
  v5 = objc_msgSend(a3, "isTranscriptionRated");
  v6 = objc_msgSend(a3, "isTranscribing");
  v7 = objc_msgSend(a3, "transcriptionAttempted");
  v8 = objc_msgSend(a3, "isTranscriptionAvailable");
  v9 = objc_msgSend(a3, "transcript");
  v10 = -[VMMessageTranscriptViewModel initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:](self, "initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:", v5, v6, v7, v8, v9);
  swift_unknownObjectRelease(v9);
  swift_unknownObjectRelease(a3);
  return v10;
}

@end
