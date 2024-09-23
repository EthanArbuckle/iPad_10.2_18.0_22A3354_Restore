@implementation MPVoicemailMessageViewModel

- (BOOL)isEqual:(id)a3
{
  MPVoicemailMessageViewModel *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (MPVoicemailMessageViewModel *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[MPVoicemailMessageViewModel isEqualToVoicemailMessageViewModel:](self, "isEqualToVoicemailMessageViewModel:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToVoicemailMessageViewModel:(id)a3
{
  id v4;
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
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  if (objc_msgSend(v5, "isEqualToDate:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedDate](self, "localizedDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDate"));
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedDuration](self, "localizedDuration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDuration"));
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedTitle](self, "localizedTitle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedTitle"));
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          v36 = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedSubtitle](self, "localizedSubtitle"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSubtitle"));
          v38 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedTranscriptionMessage](self, "localizedTranscriptionMessage"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedTranscriptionMessage"));
            v35 = v14;
            if (objc_msgSend(v14, "isEqualToString:"))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedSenderIdentityTitle](self, "localizedSenderIdentityTitle"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedSenderIdentityTitle"));
              v33 = v15;
              if (objc_msgSend(v15, "isEqualToString:"))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedAttributedRestrictedAlertTitle](self, "localizedAttributedRestrictedAlertTitle"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedAttributedRestrictedAlertTitle"));
                v31 = v16;
                v17 = objc_msgSend(v16, "isEqualToAttributedString:");
                v11 = v36;
                if (!v17)
                  goto LABEL_15;
                -[MPVoicemailMessageViewModel duration](self, "duration");
                v19 = v18;
                objc_msgSend(v4, "duration");
                if (v19 != v20)
                  goto LABEL_15;
                v24 = -[MPVoicemailMessageViewModel showsPlayerControls](self, "showsPlayerControls");
                if (v24 == objc_msgSend(v4, "showsPlayerControls")
                  && (v25 = -[MPVoicemailMessageViewModel showsRestrictedAlertView](self, "showsRestrictedAlertView"),
                      v25 == objc_msgSend(v4, "showsRestrictedAlertView"))
                  && (v26 = -[MPVoicemailMessageViewModel showsTranscriptionView](self, "showsTranscriptionView"),
                      v26 == objc_msgSend(v4, "showsTranscriptionView"))
                  && (v27 = -[MPVoicemailMessageViewModel isRead](self, "isRead"),
                      v27 == objc_msgSend(v4, "isRead"))
                  && (v28 = -[MPVoicemailMessageViewModel isDeleted](self, "isDeleted"),
                      v28 == objc_msgSend(v4, "isDeleted")))
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel transcriptViewModel](self, "transcriptViewModel"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transcriptViewModel"));
                  v21 = v29 == v23;

                }
                else
                {
LABEL_15:
                  v21 = 0;
                }

              }
              else
              {
                v21 = 0;
                v11 = v36;
              }

            }
            else
            {
              v21 = 0;
              v11 = v36;
            }

          }
          else
          {
            v21 = 0;
            v11 = v36;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel date](self, "date"));
  v31 = (unint64_t)objc_msgSend(v36, "hash");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedDate](self, "localizedDate"));
  v30 = (unint64_t)objc_msgSend(v35, "hash");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedDuration](self, "localizedDuration"));
  v29 = (unint64_t)objc_msgSend(v34, "hash");
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedTitle](self, "localizedTitle"));
  v28 = (unint64_t)objc_msgSend(v33, "hash");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedSubtitle](self, "localizedSubtitle"));
  v27 = (unint64_t)objc_msgSend(v32, "hash");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedTranscriptionMessage](self, "localizedTranscriptionMessage"));
  v26 = (unint64_t)objc_msgSend(v3, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedSenderIdentityTitle](self, "localizedSenderIdentityTitle"));
  v25 = (unint64_t)objc_msgSend(v4, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel localizedAttributedRestrictedAlertTitle](self, "localizedAttributedRestrictedAlertTitle"));
  v24 = (unint64_t)objc_msgSend(v5, "hash");
  -[MPVoicemailMessageViewModel duration](self, "duration");
  v7 = -v6;
  if (v6 >= 0.0)
    v7 = v6;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = fmod(v8, 1.84467441e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0)
    v14 = v13;
  else
    v14 = v12;
  if (-[MPVoicemailMessageViewModel showsPlayerControls](self, "showsPlayerControls"))
  {
    if (-[MPVoicemailMessageViewModel showsPlayerControls](self, "showsPlayerControls"))
      v15 = 2654435761;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  if (-[MPVoicemailMessageViewModel showsRestrictedAlertView](self, "showsRestrictedAlertView"))
  {
    if (-[MPVoicemailMessageViewModel showsRestrictedAlertView](self, "showsRestrictedAlertView"))
      v16 = 2654435761;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  if (-[MPVoicemailMessageViewModel showsTranscriptionView](self, "showsTranscriptionView"))
  {
    if (-[MPVoicemailMessageViewModel showsTranscriptionView](self, "showsTranscriptionView"))
      v17 = 2654435761;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  if (-[MPVoicemailMessageViewModel isRead](self, "isRead"))
  {
    if (-[MPVoicemailMessageViewModel isRead](self, "isRead"))
      v18 = 2654435761;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  if (-[MPVoicemailMessageViewModel isDeleted](self, "isDeleted"))
  {
    if (-[MPVoicemailMessageViewModel isDeleted](self, "isDeleted"))
      v19 = 2654435761;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailMessageViewModel transcriptViewModel](self, "transcriptViewModel"));
  v22 = v20 ^ (unint64_t)objc_msgSend(v21, "hash") ^ v24 ^ v14;

  return v22;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)localizedDate
{
  return self->_localizedDate;
}

- (void)setLocalizedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedDuration
{
  return self->_localizedDuration;
}

- (void)setLocalizedDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedTranscriptionMessage
{
  return self->_localizedTranscriptionMessage;
}

- (void)setLocalizedTranscriptionMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)localizedSenderIdentityTitle
{
  return self->_localizedSenderIdentityTitle;
}

- (void)setLocalizedSenderIdentityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSAttributedString)localizedAttributedRestrictedAlertTitle
{
  return self->_localizedAttributedRestrictedAlertTitle;
}

- (void)setLocalizedAttributedRestrictedAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)showsPlayerControls
{
  return self->_showsPlayerControls;
}

- (void)setShowsPlayerControls:(BOOL)a3
{
  self->_showsPlayerControls = a3;
}

- (BOOL)showsTranscriptionView
{
  return self->_showsTranscriptionView;
}

- (void)setShowsTranscriptionView:(BOOL)a3
{
  self->_showsTranscriptionView = a3;
}

- (BOOL)showsRestrictedAlertView
{
  return self->_showsRestrictedAlertView;
}

- (void)setShowsRestrictedAlertView:(BOOL)a3
{
  self->_showsRestrictedAlertView = a3;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (VMMessageTranscriptViewModel)transcriptViewModel
{
  return self->_transcriptViewModel;
}

- (void)setTranscriptViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptViewModel, 0);
  objc_storeStrong((id *)&self->_localizedAttributedRestrictedAlertTitle, 0);
  objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, 0);
  objc_storeStrong((id *)&self->_localizedTranscriptionMessage, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDuration, 0);
  objc_storeStrong((id *)&self->_localizedDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
