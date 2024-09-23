@implementation HDBradycardiaDataAggregator

- (id)_categoryType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[HDHeartEventDataAggregator triggerImmediateCloudSyncWithReason:](self, CFSTR("New Low Heart Rate Notification sample added"));
  v14.receiver = self;
  v14.super_class = (Class)HDBradycardiaDataAggregator;
  LOBYTE(a6) = -[HDHeartEventDataAggregator didPersistObjects:lastDatum:collector:error:](&v14, sel_didPersistObjects_lastDatum_collector_error_, v12, v11, v10, a6);

  return (char)a6;
}

@end
