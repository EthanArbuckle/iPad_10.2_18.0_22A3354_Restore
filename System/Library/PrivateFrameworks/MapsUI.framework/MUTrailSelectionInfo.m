@implementation MUTrailSelectionInfo

- (MUTrailSelectionInfo)initWithTrailID:(unint64_t)a3 trailName:(id)a4
{
  id v6;
  MUTrailSelectionInfo *v7;
  MUTrailSelectionInfo *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MUTrailSelectionInfo;
  v7 = -[MUTrailSelectionInfo init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MUTrailSelectionInfo setTrailID:](v7, "setTrailID:", a3);
    -[MUTrailSelectionInfo setTrailName:](v8, "setTrailName:", v6);
  }

  return v8;
}

- (unint64_t)trailID
{
  return self->_trailID;
}

- (void)setTrailID:(unint64_t)a3
{
  self->_trailID = a3;
}

- (NSString)trailName
{
  return self->_trailName;
}

- (void)setTrailName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailName, 0);
}

@end
