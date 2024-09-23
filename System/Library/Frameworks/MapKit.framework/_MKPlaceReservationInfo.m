@implementation _MKPlaceReservationInfo

- (_MKPlaceReservationInfo)initWithOpenTimes:(id)a3 attributionProviderName:(id)a4 providerLogoImage:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _MKPlaceReservationInfo *v14;
  uint64_t v15;
  NSArray *openTimes;
  uint64_t v17;
  NSString *attributionProviderDisplayName;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_MKPlaceReservationInfo;
  v14 = -[_MKPlaceReservationInfo init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    openTimes = v14->_openTimes;
    v14->_openTimes = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    attributionProviderDisplayName = v14->_attributionProviderDisplayName;
    v14->_attributionProviderDisplayName = (NSString *)v17;

    objc_storeStrong((id *)&v14->_attributionProviderLogoImage, a5);
    objc_storeWeak((id *)&v14->_reservationDelegate, v13);
  }

  return v14;
}

- (NSString)attributionProviderDisplayName
{
  return self->_attributionProviderDisplayName;
}

- (UIImage)attributionProviderLogoImage
{
  return self->_attributionProviderLogoImage;
}

- (NSArray)openTimes
{
  return self->_openTimes;
}

- (_MKPlaceReservationDelegate)reservationDelegate
{
  return (_MKPlaceReservationDelegate *)objc_loadWeakRetained((id *)&self->_reservationDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reservationDelegate);
  objc_storeStrong((id *)&self->_openTimes, 0);
  objc_storeStrong((id *)&self->_attributionProviderLogoImage, 0);
  objc_storeStrong((id *)&self->_attributionProviderDisplayName, 0);
}

@end
