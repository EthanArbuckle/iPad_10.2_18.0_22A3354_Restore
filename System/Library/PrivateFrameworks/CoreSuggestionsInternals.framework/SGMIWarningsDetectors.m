@implementation SGMIWarningsDetectors

- (SGMIWarningsDetectors)initWithAttachmentDictionary:(id)a3 recipientConservativeDictionary:(id)a4 recipientDictionary:(id)a5 nicknameDictionary:(id)a6 followUpOnOutgoingMailsQuestionsDictionary:(id)a7 followUpOnOutgoingMailsAsksDictionary:(id)a8 followUpOnIncomingMailsDictionary:(id)a9 compiledRegexCache:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SGMIWarningsDetectors *v24;
  SGMIWarningsDetectionRegexes *v25;
  SGMIWarningsDetectionRegexes *attachment;
  SGMIWarningsDetectionRegexes *v27;
  SGMIWarningsDetectionRegexes *recipientConservative;
  SGMIWarningsDetectionRegexes *v29;
  SGMIWarningsDetectionRegexes *recipient;
  SGMIWarningsDetectionRegexes *v31;
  SGMIWarningsDetectionRegexes *nickname;
  SGMIWarningsDetectionRegexes *v33;
  SGMIWarningsDetectionRegexes *followUpOnOutgoingMailsQuestions;
  SGMIWarningsDetectionRegexes *v35;
  SGMIWarningsDetectionRegexes *followUpOnOutgoingMailsAsks;
  SGMIWarningsDetectionRegexes *v37;
  SGMIWarningsDetectionRegexes *followUpOnIncomingMails;
  objc_super v40;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)SGMIWarningsDetectors;
  v24 = -[SGMIWarningsDetectors init](&v40, sel_init);
  if (v24)
  {
    if (v16)
    {
      v25 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:]([SGMIWarningsDetectionRegexes alloc], "initWithDictionary:compiledRegexCache:", v16, v23);
      attachment = v24->_attachment;
      v24->_attachment = v25;

    }
    if (v17)
    {
      v27 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:]([SGMIWarningsDetectionRegexes alloc], "initWithDictionary:compiledRegexCache:", v17, v23);
      recipientConservative = v24->_recipientConservative;
      v24->_recipientConservative = v27;

    }
    if (v18)
    {
      v29 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:]([SGMIWarningsDetectionRegexes alloc], "initWithDictionary:compiledRegexCache:", v18, v23);
      recipient = v24->_recipient;
      v24->_recipient = v29;

    }
    if (v19)
    {
      v31 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:]([SGMIWarningsDetectionRegexes alloc], "initWithDictionary:compiledRegexCache:", v19, v23);
      nickname = v24->_nickname;
      v24->_nickname = v31;

    }
    if (v20)
    {
      v33 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:]([SGMIWarningsDetectionRegexes alloc], "initWithDictionary:compiledRegexCache:", v20, v23);
      followUpOnOutgoingMailsQuestions = v24->_followUpOnOutgoingMailsQuestions;
      v24->_followUpOnOutgoingMailsQuestions = v33;

    }
    if (v21)
    {
      v35 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:]([SGMIWarningsDetectionRegexes alloc], "initWithDictionary:compiledRegexCache:", v21, v23);
      followUpOnOutgoingMailsAsks = v24->_followUpOnOutgoingMailsAsks;
      v24->_followUpOnOutgoingMailsAsks = v35;

    }
    if (v22)
    {
      v37 = -[SGMIWarningsDetectionRegexes initWithDictionary:compiledRegexCache:]([SGMIWarningsDetectionRegexes alloc], "initWithDictionary:compiledRegexCache:", v22, v23);
      followUpOnIncomingMails = v24->_followUpOnIncomingMails;
      v24->_followUpOnIncomingMails = v37;

    }
  }

  return v24;
}

- (id)description
{
  SGMIWarningsDetectionRegexes *attachment;
  SGMIWarningsDetectionRegexes *recipientConservative;
  SGMIWarningsDetectionRegexes *recipient;
  __CFString *v6;
  SGMIWarningsDetectionRegexes *followUpOnOutgoingMailsQuestions;
  __CFString *v8;
  SGMIWarningsDetectionRegexes *followUpOnOutgoingMailsAsks;
  __CFString *v10;
  SGMIWarningsDetectionRegexes *followUpOnIncomingMails;
  void *v12;
  void *v13;
  id v15;
  __CFString *v16;
  __CFString *v17;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  attachment = self->_attachment;
  if (attachment)
  {
    -[SGMIWarningsDetectionRegexes description](self->_attachment, "description");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("(null)");
  }
  recipientConservative = self->_recipientConservative;
  if (recipientConservative)
  {
    -[SGMIWarningsDetectionRegexes description](self->_recipientConservative, "description");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR("(null)");
  }
  recipient = self->_recipient;
  if (recipient)
  {
    -[SGMIWarningsDetectionRegexes description](self->_recipient, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("(null)");
  }
  followUpOnOutgoingMailsQuestions = self->_followUpOnOutgoingMailsQuestions;
  if (followUpOnOutgoingMailsQuestions)
  {
    -[SGMIWarningsDetectionRegexes description](self->_followUpOnOutgoingMailsQuestions, "description");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("(null)");
  }
  followUpOnOutgoingMailsAsks = self->_followUpOnOutgoingMailsAsks;
  if (followUpOnOutgoingMailsAsks)
  {
    -[SGMIWarningsDetectionRegexes description](self->_followUpOnOutgoingMailsAsks, "description");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("(null)");
  }
  followUpOnIncomingMails = self->_followUpOnIncomingMails;
  if (followUpOnIncomingMails)
  {
    -[SGMIWarningsDetectionRegexes description](followUpOnIncomingMails, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("<SGMIWarningsDetectors>\n    attachment:%@\n    recipientConservative:%@\n    recipient:%@\n    followUpOnOutgoingMailsQuestions:%@\n    followUpOnOutgoingMailsAsks:%@\n    followUpOnIncomingMails:%@"), v17, v16, v6, v8, v10, v12);

    if (!followUpOnOutgoingMailsAsks)
      goto LABEL_19;
    goto LABEL_18;
  }
  v13 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("<SGMIWarningsDetectors>\n    attachment:%@\n    recipientConservative:%@\n    recipient:%@\n    followUpOnOutgoingMailsQuestions:%@\n    followUpOnOutgoingMailsAsks:%@\n    followUpOnIncomingMails:%@"), v17, v16, v6, v8, v10, CFSTR("(null)"));
  if (followUpOnOutgoingMailsAsks)
LABEL_18:

LABEL_19:
  if (followUpOnOutgoingMailsQuestions)

  if (recipient)
  if (recipientConservative)

  if (attachment)
  return v13;
}

- (SGMIWarningsDetectionRegexes)attachment
{
  return self->_attachment;
}

- (SGMIWarningsDetectionRegexes)recipientConservative
{
  return self->_recipientConservative;
}

- (SGMIWarningsDetectionRegexes)recipient
{
  return self->_recipient;
}

- (SGMIWarningsDetectionRegexes)nickname
{
  return self->_nickname;
}

- (SGMIWarningsDetectionRegexes)followUpOnOutgoingMailsQuestions
{
  return self->_followUpOnOutgoingMailsQuestions;
}

- (SGMIWarningsDetectionRegexes)followUpOnOutgoingMailsAsks
{
  return self->_followUpOnOutgoingMailsAsks;
}

- (SGMIWarningsDetectionRegexes)followUpOnIncomingMails
{
  return self->_followUpOnIncomingMails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpOnIncomingMails, 0);
  objc_storeStrong((id *)&self->_followUpOnOutgoingMailsAsks, 0);
  objc_storeStrong((id *)&self->_followUpOnOutgoingMailsQuestions, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_recipientConservative, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
