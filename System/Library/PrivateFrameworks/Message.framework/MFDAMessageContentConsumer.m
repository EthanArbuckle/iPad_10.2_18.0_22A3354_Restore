@implementation MFDAMessageContentConsumer

- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4
{
  self->_didBeginStreaming = 1;
  self->_timeOfLastActivity = CFAbsoluteTimeGetCurrent();
  return 1;
}

- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6
{
  _BOOL4 v10;
  char *v11;
  int v12;
  char *v13;
  char *v14;
  size_t v15;
  _BYTE *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableData *v22;
  NSMutableData *v23;
  void *v24;
  void *v25;
  NSMutableData *v26;
  void *v27;
  void *v28;
  NSMutableData *bodyData;
  NSMutableData *v30;
  NSMutableData *v31;
  id v33;

  v33 = a6;
  self->_timeOfLastActivity = CFAbsoluteTimeGetCurrent();
  if (a5)
    v10 = 0;
  else
    v10 = self->_requestedFormat == 1;
  v11 = (char *)malloc_type_malloc(a4, 0x100004077774924uLL);
  v12 = 0;
  v13 = v11;
  v14 = a3;
  do
  {
    v15 = a3 - v14 + a4;
    v16 = memccpy(v13, v14, 13, v15);
    if (v16)
    {
      v14 += v16 - v13;
      v13 = v16 - 1;
      ++v12;
      v17 = v14 - a3;
    }
    else
    {
      v14 = &a3[a4];
      v13 += v15;
      v17 = a4;
    }
  }
  while (v17 < a4);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithBytesNoCopy:length:", v11, v13 - v11);
  if (objc_msgSend(v18, "length") != a4 - v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageContentConsumer.m"), 73, CFSTR("sanity check \r removal."));

    if (v10)
      goto LABEL_11;
LABEL_18:
    bodyData = self->_bodyData;
    if (bodyData)
    {
      -[NSMutableData appendData:](bodyData, "appendData:", v18);
    }
    else
    {
      v30 = (NSMutableData *)objc_msgSend(v18, "mutableCopy");
      v31 = self->_bodyData;
      self->_bodyData = v30;

    }
    -[MFDAMessageContentConsumer dataConsumer](self, "dataConsumer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appendData:", v18);
    goto LABEL_22;
  }
  if (!v10)
    goto LABEL_18;
LABEL_11:
  if (!self->_triedCreatingAlternatePartConsumer)
  {
    self->_triedCreatingAlternatePartConsumer = 1;
    -[MFDAMessageContentConsumer consumerFactory](self, "consumerFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataConsumerForPart:", CFSTR("1.1"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDAMessageContentConsumer setAlternatePartConsumer:](self, "setAlternatePartConsumer:", v20);

    -[MFDAMessageContentConsumer alternatePartConsumer](self, "alternatePartConsumer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      copyRFC822DataForPlainTextMessage(v33, 0, 1);
      v22 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      v23 = self->_bodyData;
      self->_bodyData = v22;

      -[MFDAMessageContentConsumer dataConsumer](self, "dataConsumer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFDAMessageContentConsumer bodyData](self, "bodyData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendData:", v25);

    }
    else
    {
      v26 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithCapacity:", 0);
      v24 = self->_bodyData;
      self->_bodyData = v26;
    }

  }
  -[MFDAMessageContentConsumer alternatePartConsumer](self, "alternatePartConsumer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendData:", v18);
LABEL_22:

}

- (void)didEndStreamingForMailMessage:(id)a3
{
  DAMailMessage *v4;
  void *v5;
  void *v6;
  DAMailMessage *message;

  v4 = (DAMailMessage *)a3;
  self->_timeOfLastActivity = CFAbsoluteTimeGetCurrent();
  -[MFDAMessageContentConsumer alternatePartConsumer](self, "alternatePartConsumer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "done");

  -[MFDAMessageContentConsumer dataConsumer](self, "dataConsumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "done");

  message = self->_message;
  self->_message = v4;

  self->_succeeded = 1;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (BOOL)didBeginStreaming
{
  return self->_didBeginStreaming;
}

- (id)dataConsumerForPart:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFDAMessageContentConsumer consumerFactory](self, "consumerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataConsumerForPart:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MFCollectingDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_dataConsumer, a3);
}

- (MFCollectingDataConsumer)alternatePartConsumer
{
  return self->_alternatePartConsumer;
}

- (void)setAlternatePartConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_alternatePartConsumer, a3);
}

- (DAMailMessage)message
{
  return self->_message;
}

- (NSMutableData)bodyData
{
  return self->_bodyData;
}

- (MFMessageDataConsumerFactory)consumerFactory
{
  return self->_consumerFactory;
}

- (void)setConsumerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_consumerFactory, a3);
}

- (int)requestedFormat
{
  return self->_requestedFormat;
}

- (void)setRequestedFormat:(int)a3
{
  self->_requestedFormat = a3;
}

- (double)timeOfLastActivity
{
  return self->_timeOfLastActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_consumerFactory, 0);
  objc_storeStrong((id *)&self->_alternatePartConsumer, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end
