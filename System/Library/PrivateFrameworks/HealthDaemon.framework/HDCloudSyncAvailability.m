@implementation HDCloudSyncAvailability

- (HDCloudSyncAvailability)initWithProfileType:(int64_t)a3 behavior:(id)a4
{
  id v6;
  HDCloudSyncAvailability *v7;
  HDCloudSyncAvailability *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncAvailability;
  v7 = -[HDCloudSyncAvailability init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[HDCloudSyncAvailability _setShouldPullWithProfileType:](v7, "_setShouldPullWithProfileType:", a3);
    -[HDCloudSyncAvailability _setShouldPushWithProfileType:](v8, "_setShouldPushWithProfileType:", a3);
    -[HDCloudSyncAvailability _setShouldSyncMedicalIDWithProfileType:](v8, "_setShouldSyncMedicalIDWithProfileType:", a3);
    -[HDCloudSyncAvailability _setShouldSyncSummarySharingPushWithProfileType:behavior:](v8, "_setShouldSyncSummarySharingPushWithProfileType:behavior:", a3, v6);
    -[HDCloudSyncAvailability _setShouldSyncSummarySharingPullWithProfileType:behavior:](v8, "_setShouldSyncSummarySharingPullWithProfileType:behavior:", a3, v6);
    -[HDCloudSyncAvailability _setShouldSyncAttachmentsWithProfileType:](v8, "_setShouldSyncAttachmentsWithProfileType:", a3);
    -[HDCloudSyncAvailability _setShouldSyncDeviceContextWithProfileType:](v8, "_setShouldSyncDeviceContextWithProfileType:", a3);
    -[HDCloudSyncAvailability _setShouldSyncStateEntitiesWithProfileType:](v8, "_setShouldSyncStateEntitiesWithProfileType:", a3);
  }

  return v8;
}

- (void)_setShouldPullWithProfileType:(int64_t)a3
{
  BOOL v3;

  v3 = 1;
  if (a3 <= 2)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
        return;
      v3 = 0;
    }
LABEL_8:
    self->_shouldPull = v3;
    return;
  }
  if ((unint64_t)(a3 - 3) < 2 || a3 == 100)
    goto LABEL_8;
}

- (void)_setShouldPushWithProfileType:(int64_t)a3
{
  BOOL v3;

  v3 = 1;
  if (a3 <= 2)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
        return;
      v3 = 0;
    }
LABEL_8:
    self->_shouldPush = v3;
    return;
  }
  if ((unint64_t)(a3 - 3) < 2 || a3 == 100)
    goto LABEL_8;
}

- (void)_setShouldSyncMedicalIDWithProfileType:(int64_t)a3
{
  BOOL v3;

  v3 = 1;
  if (a3 <= 2)
  {
    if (a3 != 1)
    {
      if (a3 != 2)
        return;
      v3 = 0;
    }
LABEL_8:
    self->_shouldSyncMedicalID = v3;
    return;
  }
  if ((unint64_t)(a3 - 3) < 2 || a3 == 100)
    goto LABEL_8;
}

- (void)_setShouldSyncSummarySharingPushWithProfileType:(int64_t)a3 behavior:(id)a4
{
  BOOL v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isAppleWatch") & 1) != 0 || (objc_msgSend(v8, "isRealityDevice") & 1) != 0)
  {
    v6 = 0;
    v7 = v8;
  }
  else
  {
    v7 = v8;
    if ((unint64_t)(a3 - 2) >= 3)
    {
      if (a3 == 1)
      {
        v6 = 1;
        goto LABEL_4;
      }
      if (a3 != 100)
        goto LABEL_5;
    }
    v6 = 0;
  }
LABEL_4:
  self->_shouldSyncSummarySharingPush = v6;
LABEL_5:

}

- (void)_setShouldSyncSummarySharingPullWithProfileType:(int64_t)a3 behavior:(id)a4
{
  BOOL v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isAppleWatch") & 1) != 0 || (objc_msgSend(v8, "isRealityDevice") & 1) != 0)
  {
    v6 = 0;
LABEL_4:
    v7 = v8;
LABEL_5:
    self->_shouldSyncSummarySharingPull = v6;
    goto LABEL_6;
  }
  if (a3 <= 3)
  {
    if ((unint64_t)(a3 - 2) < 2)
    {
      v6 = 1;
      goto LABEL_4;
    }
    v7 = v8;
    if (a3 != 1)
      goto LABEL_6;
LABEL_14:
    v6 = 0;
    goto LABEL_5;
  }
  v7 = v8;
  if (a3 == 100 || a3 == 4)
    goto LABEL_14;
LABEL_6:

}

- (void)_setShouldSyncAttachmentsWithProfileType:(int64_t)a3
{
  BOOL v3;

  v3 = 1;
  switch(a3)
  {
    case 1:
    case 3:
      goto LABEL_4;
    case 2:
    case 4:
      v3 = 0;
      goto LABEL_4;
    default:
      if (a3 == 100)
LABEL_4:
        self->_shouldSyncAttachments = v3;
      return;
  }
}

- (void)_setShouldSyncDeviceContextWithProfileType:(int64_t)a3
{
  BOOL v3;

  v3 = 1;
  if (a3 <= 3)
  {
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 != 1)
        return;
    }
    else
    {
      v3 = 0;
    }
    goto LABEL_6;
  }
  if (a3 == 4 || a3 == 100)
LABEL_6:
    self->_shouldSyncDeviceContext = v3;
}

- (void)_setShouldSyncStateEntitiesWithProfileType:(int64_t)a3
{
  BOOL v3;

  v3 = 1;
  if (a3 <= 3)
  {
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 != 1)
        return;
    }
    else
    {
      v3 = 0;
    }
    goto LABEL_6;
  }
  if (a3 == 4 || a3 == 100)
LABEL_6:
    self->_shouldSyncStateEntities = v3;
}

- (BOOL)shouldPull
{
  return self->_shouldPull;
}

- (BOOL)shouldPush
{
  return self->_shouldPush;
}

- (BOOL)shouldSyncMedicalID
{
  return self->_shouldSyncMedicalID;
}

- (BOOL)shouldSyncSummarySharingPush
{
  return self->_shouldSyncSummarySharingPush;
}

- (BOOL)shouldSyncSummarySharingPull
{
  return self->_shouldSyncSummarySharingPull;
}

- (BOOL)shouldSyncAttachments
{
  return self->_shouldSyncAttachments;
}

- (BOOL)shouldSyncDeviceContext
{
  return self->_shouldSyncDeviceContext;
}

- (BOOL)shouldSyncStateEntities
{
  return self->_shouldSyncStateEntities;
}

@end
