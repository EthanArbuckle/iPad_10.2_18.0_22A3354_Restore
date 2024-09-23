@implementation CPLSimpleRecordView

- (CPLSimpleRecordView)initWithRecord:(id)a3
{
  id v5;
  CPLSimpleRecordView *v6;
  CPLSimpleRecordView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleRecordView;
  v6 = -[CPLSimpleRecordView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_synthesizedRecord, a3);

  return v7;
}

- (id)scopedIdentifier
{
  return -[CPLRecordChange scopedIdentifier](self->_synthesizedRecord, "scopedIdentifier");
}

- (id)synthesizedRecord
{
  return self->_synthesizedRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizedRecord, 0);
}

@end
