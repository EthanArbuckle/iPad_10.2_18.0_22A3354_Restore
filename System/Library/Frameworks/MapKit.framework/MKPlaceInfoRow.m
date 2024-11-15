@implementation MKPlaceInfoRow

+ (id)infoRow:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = (void *)v7[3];
  v7[2] = a4;
  v7[3] = v6;

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (MKPlaceSectionRowView)rowView
{
  return self->_rowView;
}

- (BOOL)enable
{
  return self->_enable;
}

- (void)setEnable:(BOOL)a3
{
  self->_enable = a3;
}

- (BOOL)showIcon
{
  return self->_showIcon;
}

- (void)setShowIcon:(BOOL)a3
{
  self->_showIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowView, 0);
}

@end
