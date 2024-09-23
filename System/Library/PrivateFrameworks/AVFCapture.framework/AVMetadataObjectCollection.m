@implementation AVMetadataObjectCollection

- (NSArray)metadataObjects
{
  return self->_metadataObjects;
}

- (NSSet)metadataObjectTypes
{
  return self->_metadataObjectTypes;
}

+ (id)collectionWithTime:(id *)a3 metadataObjectTypes:(id)a4 handledMetadataObjectTypes:(id)a5 metadataObjects:(id)a6
{
  id v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = objc_alloc((Class)objc_opt_class());
  v12 = *a3;
  return (id)objc_msgSend(v10, "initWithTime:metadataObjectTypes:handledMetadataObjectTypes:metadataObjects:", &v12, a4, a5, a6);
}

- (AVMetadataObjectCollection)initWithTime:(id *)a3 metadataObjectTypes:(id)a4 handledMetadataObjectTypes:(id)a5 metadataObjects:(id)a6
{
  char *v10;
  AVMetadataObjectCollection *v11;
  __int128 v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVMetadataObjectCollection;
  v10 = -[AVMetadataObjectCollection init](&v14, sel_init);
  v11 = (AVMetadataObjectCollection *)v10;
  if (v10)
  {
    v12 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v10 + 3) = a3->var3;
    *(_OWORD *)(v10 + 8) = v12;
    *((_QWORD *)v10 + 4) = objc_msgSend(a4, "copy");
    v11->_handledMetadataObjectTypes = (NSSet *)objc_msgSend(a5, "copy");
    v11->_metadataObjects = (NSArray *)a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataObjectCollection;
  -[AVMetadataObjectCollection dealloc](&v3, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (NSSet)handledMetadataObjectTypes
{
  return self->_handledMetadataObjectTypes;
}

@end
