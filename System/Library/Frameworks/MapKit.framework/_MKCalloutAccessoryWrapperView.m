@implementation _MKCalloutAccessoryWrapperView

- (_MKCalloutAccessoryWrapperView)initWithView:(id)a3
{
  id v5;
  _MKCalloutAccessoryWrapperView *v6;
  _MKCalloutAccessoryWrapperView *v7;
  id *p_view;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _MKCalloutAccessoryWrapperView *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MKCalloutAccessoryWrapperView;
  v6 = -[_MKCalloutAccessoryWrapperView init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    p_view = (id *)&v6->_view;
    objc_storeStrong((id *)&v6->_view, a3);
    v9 = *p_view;
    if (*p_view)
    {
      objc_msgSend(v9, "bounds");
      objc_msgSend(*p_view, "setFrame:");
      -[_MKCalloutAccessoryWrapperView addSubview:](v7, "addSubview:", *p_view);
      v9 = *p_view;
    }
    objc_msgSend(v9, "bounds");
    -[_MKCalloutAccessoryWrapperView setBounds:](v7, "setBounds:");
    LODWORD(v10) = 1148846080;
    -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](v7, "_mapkit_setContentCompressionResistancePriority:forAxis:", 1, v10);
    LODWORD(v11) = 1148846080;
    -[UIView _mapkit_setContentCompressionResistancePriority:forAxis:](v7, "_mapkit_setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1148846080;
    -[UIView _mapkit_setContentHuggingPriority:forAxis:](v7, "_mapkit_setContentHuggingPriority:forAxis:", 1, v12);
    LODWORD(v13) = 1148846080;
    -[UIView _mapkit_setContentHuggingPriority:forAxis:](v7, "_mapkit_setContentHuggingPriority:forAxis:", 0, v13);
    -[_MKCalloutAccessoryWrapperView setClipsToBounds:](v7, "setClipsToBounds:", !_MKLinkedOnOrAfterReleaseSet(2310));
    v14 = v7;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_MKCalloutAccessoryView bounds](self->_view, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)_mapkit_accessoryControlToExtendWithCallout
{
  return (id)-[_MKCalloutAccessoryView _mapkit_accessoryControlToExtendWithCallout](self->_view, "_mapkit_accessoryControlToExtendWithCallout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
