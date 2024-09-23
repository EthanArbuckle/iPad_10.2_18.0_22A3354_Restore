@implementation MusicKit_SoftLinking_MPServerObjectDatabaseImportResult

- (id)_initWithUnderlyingImportResult:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPServerObjectDatabaseImportResult *v6;
  MusicKit_SoftLinking_MPServerObjectDatabaseImportResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPServerObjectDatabaseImportResult;
  v6 = -[MusicKit_SoftLinking_MPServerObjectDatabaseImportResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingImportResult, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingImportResult, 0);
}

@end
