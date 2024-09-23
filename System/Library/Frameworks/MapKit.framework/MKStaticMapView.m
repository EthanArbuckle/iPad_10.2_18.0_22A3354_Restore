@implementation MKStaticMapView

void __54___MKStaticMapView__displayGridWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  if (v4 && *(_QWORD *)(a1 + 48) == *(_QWORD *)(v5 + 624))
  {
    objc_storeStrong((id *)(v5 + 440), a2);
    objc_msgSend(v8, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setImage:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_showAllAnnotations");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "updateAnnotationViewsForReason:", 2);
    v5 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

_QWORD *__36___MKStaticMapView__updateSnapshot___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[78] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_startSnapshotRequest");
  return result;
}

void __41___MKStaticMapView__startSnapshotRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  id v16;

  v16 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v7 + 624))
  {
    *(_BYTE *)(v7 + 634) = 0;
    v8 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      objc_storeStrong((id *)(v8 + 448), a2);
      objc_msgSend(v16, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setImage:", v9);

      objc_msgSend(*(id *)(a1 + 32), "_showAllAnnotations");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "updateAnnotationViewsForReason:", 2);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 640));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 640));
        objc_msgSend(v12, "mapViewDidFinishLoadingMap:", *(_QWORD *)(a1 + 32));
LABEL_9:

      }
    }
    else
    {
      objc_msgSend(*(id *)(v8 + 424), "image");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        objc_msgSend(*(id *)(a1 + 32), "_stopUpdatingUserLocation");
      v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 640));
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 640));
        objc_msgSend(v12, "mapViewDidFailLoadingMap:withError:", *(_QWORD *)(a1 + 32), v6);
        goto LABEL_9;
      }
    }
  }

}

uint64_t __51___MKStaticMapView_locationManagerUpdatedLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setLocation:", *(_QWORD *)(a1 + 40));
}

uint64_t __38___MKStaticMapView_annotationRectTest__block_invoke()
{
  return 2;
}

uint64_t __44___MKStaticMapView_annotationCoordinateTest__block_invoke()
{
  return 1;
}

uint64_t __70___MKStaticMapView_annotationManager_didAddAnnotationRepresentations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "selectAnnotation:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528), 0);
}

@end
