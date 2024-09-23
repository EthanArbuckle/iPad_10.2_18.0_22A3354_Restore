@implementation ICAttachmentBrickMapAnnotationV2

- (ICAttachmentBrickMapAnnotationV2)initWithAttachment:(id)a3
{
  id v4;
  ICAttachmentBrickMapAnnotationV2 *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  ICAttachmentBrickMapAnnotationV2 *v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  void *v14;
  CLLocationDegrees v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICAttachmentBrickMapAnnotationV2;
  v5 = -[ICAttachmentBrickMapAnnotationV2 init](&v17, sel_init);
  if (!v5)
  {
LABEL_4:
    v10 = v5;
    goto LABEL_6;
  }
  objc_msgSend(v4, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  objc_msgSend(v4, "summary");
  v8 = objc_claimAutoreleasedReturnValue();
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v8;

  objc_msgSend(v4, "location");
  v10 = (ICAttachmentBrickMapAnnotationV2 *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latitude");
    v13 = v12;
    objc_msgSend(v4, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "longitude");
    v5->_coordinate = CLLocationCoordinate2DMake(v13, v15);

    if (!CLLocationCoordinate2DIsValid(v5->_coordinate))
    {
      v10 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
