@implementation SSSPortalView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAPortalLayer, a2);
}

- (void)setSourceView:(id)a3
{
  UIView **p_sourceView;
  id v5;
  void *v6;
  id v7;

  p_sourceView = &self->_sourceView;
  v5 = a3;
  objc_storeWeak((id *)p_sourceView, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v6, "setSourceLayer:", v7);

}

- (BOOL)hidesSourceView
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  v3 = objc_msgSend(v2, "hidesSourceLayer");

  return v3;
}

- (void)setHidesSourceView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v4, "setHidesSourceLayer:", v3);

}

- (BOOL)matchesAlpha
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  v3 = objc_msgSend(v2, "matchesOpacity");

  return v3;
}

- (void)setMatchesAlpha:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v4, "setMatchesOpacity:", v3);

}

- (BOOL)matchesTransform
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  v3 = objc_msgSend(v2, "matchesTransform");

  return v3;
}

- (void)setMatchesTransform:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v4, "setMatchesTransform:", v3);

}

- (BOOL)matchesPosition
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  v3 = objc_msgSend(v2, "matchesPosition");

  return v3;
}

- (void)setMatchesPosition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v4, "setMatchesPosition:", v3);

}

- (BOOL)allowsBackdropGroups
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  v3 = objc_msgSend(v2, "allowsBackdropGroups");

  return v3;
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v4, "setAllowsBackdropGroups:", v3);

}

- (void)setSourceContextId:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v4, "setSourceContextId:", v3);

}

- (unsigned)sourceContextId
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  v3 = objc_msgSend(v2, "sourceContextId");

  return v3;
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  objc_msgSend(v4, "setSourceLayerRenderId:", a3);

}

- (unint64_t)sourceLayerRenderId
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPortalView portalLayer](self, "portalLayer"));
  v3 = objc_msgSend(v2, "sourceLayerRenderId");

  return (unint64_t)v3;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
