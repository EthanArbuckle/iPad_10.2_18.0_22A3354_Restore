@implementation PDCRemoteAssetOriginalPreviewController

- (id)imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5
{
  double height;
  double width;
  id v8;
  id v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  double v22;
  double v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint64_t *v27;
  double v28;
  double v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_100002614;
  v35 = sub_100002624;
  v36 = 0;
  v9 = objc_msgSend(v8, "mediaType");
  if (v9 == (id)1)
  {
    v15 = objc_alloc_init((Class)PHImageRequestOptions);
    objc_msgSend(v15, "setVersion:", 1);
    objc_msgSend(v15, "setDeliveryMode:", 1);
    objc_msgSend(v15, "setSynchronous:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](PHImageManager, "defaultManager"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000262C;
    v24[3] = &unk_100004210;
    v27 = &v31;
    v10 = v15;
    v25 = v10;
    v26 = v8;
    v28 = width;
    v29 = height;
    v30 = a5;
    objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v26, a5, v10, v24, width, height);

    v13 = v25;
    goto LABEL_5;
  }
  if (v9 == (id)2)
  {
    v10 = objc_alloc_init((Class)PHVideoRequestOptions);
    -[NSObject setVersion:](v10, "setVersion:", 1);
    v11 = dispatch_semaphore_create(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHImageManager defaultManager](PHImageManager, "defaultManager"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000026F0;
    v19[3] = &unk_100004238;
    v21 = &v31;
    v22 = width;
    v23 = height;
    v13 = v11;
    v20 = v13;
    objc_msgSend(v12, "requestAVAssetForVideo:options:resultHandler:", v8, v10, v19);

    v14 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v13, v14);

LABEL_5:
  }
  v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v17;
}

@end
