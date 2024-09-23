@implementation SUUIProductPage

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDefaultPageFragment:", self->_defaultPageFragment);
  objc_msgSend(v4, "setItem:", self->_item);
  objc_msgSend(v4, "setITMLData:", self->_itmlData);
  objc_msgSend(v4, "setITMLResponse:", self->_itmlResponse);
  objc_msgSend(v4, "setMetricsConfiguration:", self->_metricsConfiguration);
  objc_msgSend(v4, "setMetricsPageDescription:", self->_metricsPageDescription);
  objc_msgSend(v4, "setPageURL:", self->_pageURL);
  objc_msgSend(v4, "setProductInformation:", self->_productInformation);
  objc_msgSend(v4, "setRelatedContentSwooshes:", self->_relatedContentSwooshes);
  objc_msgSend(v4, "setReviewConfiguration:", self->_reviewConfiguration);
  objc_msgSend(v4, "setUber:", self->_uber);
  return v4;
}

- (int64_t)defaultPageFragment
{
  return self->_defaultPageFragment;
}

- (void)setDefaultPageFragment:(int64_t)a3
{
  self->_defaultPageFragment = a3;
}

- (SUUIProductPageItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSData)ITMLData
{
  return self->_itmlData;
}

- (void)setITMLData:(id)a3
{
  objc_storeStrong((id *)&self->_itmlData, a3);
}

- (NSHTTPURLResponse)ITMLResponse
{
  return self->_itmlResponse;
}

- (void)setITMLResponse:(id)a3
{
  objc_storeStrong((id *)&self->_itmlResponse, a3);
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return self->_metricsConfiguration;
}

- (void)setMetricsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_metricsConfiguration, a3);
}

- (NSString)metricsPageDescription
{
  return self->_metricsPageDescription;
}

- (void)setMetricsPageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SUUIProductPageProductInfo)productInformation
{
  return self->_productInformation;
}

- (void)setProductInformation:(id)a3
{
  objc_storeStrong((id *)&self->_productInformation, a3);
}

- (NSArray)relatedContentSwooshes
{
  return self->_relatedContentSwooshes;
}

- (void)setRelatedContentSwooshes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SUUIReviewConfiguration)reviewConfiguration
{
  return self->_reviewConfiguration;
}

- (void)setReviewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_reviewConfiguration, a3);
}

- (SUUIUber)uber
{
  return self->_uber;
}

- (void)setUber:(id)a3
{
  objc_storeStrong((id *)&self->_uber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_reviewConfiguration, 0);
  objc_storeStrong((id *)&self->_relatedContentSwooshes, 0);
  objc_storeStrong((id *)&self->_productInformation, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_metricsPageDescription, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_itmlResponse, 0);
  objc_storeStrong((id *)&self->_itmlData, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
