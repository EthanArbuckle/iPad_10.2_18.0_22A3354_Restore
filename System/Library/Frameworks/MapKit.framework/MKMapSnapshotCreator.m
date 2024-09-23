@implementation MKMapSnapshotCreator

+ (BOOL)supportsSharingThumbnails
{
  return objc_msgSend(MEMORY[0x1E0DC6518], "supportsSharingThumbnails");
}

- (MKMapSnapshotCreator)init
{
  MKMapSnapshotCreator *v2;
  NSLock *v3;
  NSLock *requestLock;
  NSMutableArray *v5;
  NSMutableArray *requests;
  MKMapSnapshotCreator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKMapSnapshotCreator;
  v2 = -[MKMapSnapshotCreator init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    requestLock = v2->_requestLock;
    v2->_requestLock = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = v2->_requests;
    v2->_requests = v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MKMapSnapshotCreator servingRequest](self, "servingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)MKMapSnapshotCreator;
  -[MKMapSnapshotCreator dealloc](&v4, sel_dealloc);
}

- (void)_processRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_servingRequest)
  {
    -[NSLock lock](self->_requestLock, "lock");
    if (-[NSMutableArray count](self->_requests, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapSnapshotCreator setServingRequest:](self, "setServingRequest:", v3);

      -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
    }
    -[NSLock unlock](self->_requestLock, "unlock");
    -[MKMapSnapshotCreator servingRequest](self, "servingRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MKMapSnapshotCreator _respondWithSnapshot](self, "_respondWithSnapshot");
      -[MKMapSnapshotCreator _processRequest](self, "_processRequest");
    }
    else
    {
      -[MKMapSnapshotCreator servingRequest](self, "servingRequest");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");

    }
  }
}

- (id)_newSnapshotWithView:(id)a3
{
  id v4;
  void *v5;
  UIImage *lastSnapshot;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  void *v12;
  UIImage *v13;
  CGSize v15;

  v4 = a3;
  v5 = v4;
  lastSnapshot = self->_lastSnapshot;
  if (!v4)
  {
    if (lastSnapshot)
    {
      v13 = lastSnapshot;
      goto LABEL_7;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  if (!lastSnapshot)
    goto LABEL_6;
  objc_msgSend(v4, "frame");
  v8 = v7;
  v10 = v9;
  -[UIImage size](self->_lastSnapshot, "size");
  UIGraphicsBeginImageContextWithOptions(v15, 1, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[UIImage drawAtPoint:](self->_lastSnapshot, "drawAtPoint:", 0.0, 0.0);
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, v8, v10);
  objc_msgSend(v5, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "renderInContext:", CurrentContext);

  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_7:

  return v13;
}

- (void)_respondWithSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  UIImage *lastSnapshot;
  NSString *v9;
  NSString *lastAttributionString;
  id v11;
  NSString *v12;
  void *v13;
  id v14;

  -[MKMapSnapshotCreator servingRequest](self, "servingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v14 = v3;
    objc_msgSend(v3, "requester");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mapSnapshotCreator:viewForContext:", self, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v14, "image");
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    lastSnapshot = self->_lastSnapshot;
    self->_lastSnapshot = v7;

    objc_msgSend(v14, "attributionString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastAttributionString = self->_lastAttributionString;
    self->_lastAttributionString = v9;

    v11 = -[MKMapSnapshotCreator _newSnapshotWithView:](self, "_newSnapshotWithView:", v6);
    v12 = self->_lastAttributionString;
    objc_msgSend(v14, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapSnapshotCreator:didCreateSnapshot:attributionString:context:", self, v11, v12, v13);

    -[MKMapSnapshotCreator setServingRequest:](self, "setServingRequest:", 0);
    if (-[NSMutableArray count](self->_requests, "count"))
      -[MKMapSnapshotCreator _processRequest](self, "_processRequest");

    v3 = v14;
  }

}

- (void)createSnapShotWithCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(unint64_t)a4 size:(CGSize)a5 requester:(id)a6 context:(id)a7
{
  double height;
  double width;
  double longitude;
  double latitude;
  id v14;
  id v15;
  void *v16;
  MKMapSnapshotRequest *v17;

  height = a5.height;
  width = a5.width;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v14 = a7;
  v15 = a6;
  v17 = objc_alloc_init(MKMapSnapshotRequest);
  -[MKMapSnapshotRequest setCoordinate:](v17, "setCoordinate:", latitude, longitude);
  -[MKMapSnapshotRequest setRequester:](v17, "setRequester:", v15);

  -[MKMapSnapshotRequest setSize:](v17, "setSize:", width, height);
  -[MKMapSnapshotRequest setZoomLevel:](v17, "setZoomLevel:", a4);
  -[MKMapSnapshotRequest setContext:](v17, "setContext:", v14);

  -[MKMapSnapshotRequest setDelegate:](v17, "setDelegate:", self);
  -[NSLock lock](self->_requestLock, "lock");
  -[NSMutableArray addObject:](self->_requests, "addObject:", v17);
  -[NSLock unlock](self->_requestLock, "unlock");
  -[MKMapSnapshotCreator servingRequest](self, "servingRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    -[MKMapSnapshotCreator _processRequest](self, "_processRequest");

}

- (id)recreateCurrentSnapshotWithRequester:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "mapSnapshotCreator:viewForContext:", self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[MKMapSnapshotCreator _newSnapshotWithView:](self, "_newSnapshotWithView:", v8);

  return v9;
}

- (void)flushRequestQueue
{
  void *v3;

  -[MKMapSnapshotCreator servingRequest](self, "servingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[MKMapSnapshotCreator setServingRequest:](self, "setServingRequest:", 0);
  -[NSLock lock](self->_requestLock, "lock");
  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
  -[NSLock unlock](self->_requestLock, "unlock");
}

- (void)createSnapShotWithCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(unint64_t)a4 size:(CGSize)a5 handler:(id)a6
{
  double height;
  double width;
  double longitude;
  double latitude;
  id v12;

  height = a5.height;
  width = a5.width;
  longitude = a3.longitude;
  latitude = a3.latitude;
  +[MKBlockBasedSnapshotRequester snapshotRequesterWitHandler:](MKBlockBasedSnapshotRequester, "snapshotRequesterWitHandler:", a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapSnapshotCreator createSnapShotWithCoordinate:zoomLevel:size:requester:context:](self, "createSnapShotWithCoordinate:zoomLevel:size:requester:context:", a4, v12, 0, latitude, longitude, width, height);

}

- (MKMapSnapshotRequest)servingRequest
{
  return self->_servingRequest;
}

- (void)setServingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_servingRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servingRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_requestLock, 0);
  objc_storeStrong((id *)&self->_lastAttributionString, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
}

@end
