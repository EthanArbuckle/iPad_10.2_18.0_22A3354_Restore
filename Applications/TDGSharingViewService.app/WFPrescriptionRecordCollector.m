@implementation WFPrescriptionRecordCollector

- (WFPrescriptionRecordCollector)initWithTimeout:(double)a3
{
  WFPrescriptionRecordCollector *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFPrescriptionRecordCollector;
  v4 = -[WFPrescriptionRecordCollector init](&v7, "init");
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)CRXFLitePrescriptionRecordCollector), "initWithTimeout:", a3);
    -[WFPrescriptionRecordCollector setCollector:](v4, "setCollector:", v5);

  }
  return v4;
}

- (void)fetchPrescriptionRecordsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFPrescriptionRecordCollector collector](self, "collector"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005BA8;
  v7[3] = &unk_100038DB0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchPrescriptionRecordsWithCompletion:", v7);

}

- (CRXFLitePrescriptionRecordCollector)collector
{
  return self->_collector;
}

- (void)setCollector:(id)a3
{
  objc_storeStrong((id *)&self->_collector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collector, 0);
}

@end
