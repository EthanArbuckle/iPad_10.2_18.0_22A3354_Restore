void sub_10000230C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  v5 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v4, "renderInContext:", v5);
}

void sub_1000027E8(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stickerBrowserViewController"));
  objc_msgSend(v3, "reloadStickerAtIndex:", a2);

}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGContext");
}

id objc_msgSend__reloadStickersAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reloadStickersAtIndexes:");
}

id objc_msgSend__startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startAnimating");
}

id objc_msgSend__stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAnimating");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheAnimatedStickerPreviewsForOverlayTypeId:atStickerSize:previewDuration:previewFrameRate:previewCompletedBlock:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentOffset");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSource");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_effectTypeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectTypeIdentifier");
}

id objc_msgSend_funCamStickerBrowser_numberOfStickersForEffectTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "funCamStickerBrowser:numberOfStickersForEffectTypeIdentifier:");
}

id objc_msgSend_funCamStickerBrowser_stickerForIndex_forEffectTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "funCamStickerBrowser:stickerForIndex:forEffectTypeIdentifier:");
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_initEffectRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initEffectRegistry");
}

id objc_msgSend_initWithContentsOfFileURL_localizedDescription_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFileURL:localizedDescription:error:");
}

id objc_msgSend_initWithEffectTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectTypeIdentifier:");
}

id objc_msgSend_initWithEffectTypeIdentifier_stickerSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectTypeIdentifier:stickerSize:");
}

id objc_msgSend_initWithFrame_stickerSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:stickerSize:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_prepareForSnapshotting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForSnapshotting");
}

id objc_msgSend_previewUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewUrl");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadStickerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadStickerAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_renderInContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderInContext:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStickerBrowser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStickerBrowser:");
}

id objc_msgSend_setStickerBrowserViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStickerBrowserViewController:");
}

id objc_msgSend_setStickerCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStickerCache:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_stickerBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerBrowser");
}

id objc_msgSend_stickerBrowserViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerBrowserViewController");
}

id objc_msgSend_stickerCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerCache");
}

id objc_msgSend_stickerSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerSize");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_updateSnapshotWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSnapshotWithCompletionBlock:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
