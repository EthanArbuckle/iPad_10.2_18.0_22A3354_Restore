@implementation VCPProcessingStatusEntry

- (VCPProcessingStatusEntry)initWithLocalIdentifier:(id)a3 taskID:(unint64_t)a4 status:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7 andNextAttemptDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  VCPProcessingStatusEntry *v18;
  VCPProcessingStatusEntry *v19;
  objc_super v21;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)VCPProcessingStatusEntry;
  v18 = -[VCPProcessingStatusEntry init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_localIdentifier, a3);
    v19->_taskID = a4;
    v19->_status = a5;
    v19->_attempts = a6;
    objc_storeStrong((id *)&v19->_lastAttemptDate, a7);
    objc_storeStrong((id *)&v19->_nextAttemptDate, a8);
  }

  return v19;
}

+ (id)entryWithLocalIdentifier:(id)a3 taskID:(unint64_t)a4 status:(unint64_t)a5 attempts:(unint64_t)a6 lastAttemptDate:(id)a7 andNextAttemptDate:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;

  v13 = a8;
  v14 = a7;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocalIdentifier:taskID:status:attempts:lastAttemptDate:andNextAttemptDate:", v15, a4, a5, a6, v14, v13);

  return v16;
}

- (unint64_t)taskID
{
  return self->_taskID;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)attempts
{
  return self->_attempts;
}

- (NSDate)lastAttemptDate
{
  return self->_lastAttemptDate;
}

- (NSDate)nextAttemptDate
{
  return self->_nextAttemptDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextAttemptDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
