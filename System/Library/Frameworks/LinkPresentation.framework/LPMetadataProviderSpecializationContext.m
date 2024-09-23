@implementation LPMetadataProviderSpecializationContext

- (LPMetadataProviderSpecializationContext)initWithOriginalURL:(id)a3 postRedirectURL:(id)a4 MIMEType:(id)a5 webView:(id)a6 hasLoadedResource:(BOOL)a7 shouldFetchSubresources:(BOOL)a8 allowedSpecializations:(unint64_t)a9 fetchIsNotUserInitiated:(BOOL)a10
{
  id v17;
  id v18;
  id v19;
  LPMetadataProviderSpecializationContext *v20;
  LPMetadataProviderSpecializationContext *v21;
  LPMetadataProviderSpecializationContext *v22;
  id v24;
  objc_super v25;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v24 = a6;
  v25.receiver = self;
  v25.super_class = (Class)LPMetadataProviderSpecializationContext;
  v20 = -[LPMetadataProviderSpecializationContext init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_URL, a3);
    objc_storeStrong((id *)&v21->_postRedirectURL, a4);
    objc_storeStrong((id *)&v21->_MIMEType, a5);
    objc_storeStrong((id *)&v21->_webView, a6);
    v21->_hasLoadedResource = a7;
    v21->_shouldFetchSubresources = a8;
    v21->_allowedSpecializations = a9;
    v21->_fetchIsNotUserInitiated = a10;
    v22 = v21;
  }

  return v21;
}

- (LPEvent)event
{
  LPMetadataProviderSpecializationContext *v2;
  LPEvent *event;
  uint64_t v4;
  LPEvent *v5;
  id eventGenerator;
  LPEvent *v7;

  v2 = self;
  objc_sync_enter(v2);
  event = v2->_event;
  if (!event)
  {
    (*((void (**)(void))v2->_eventGenerator + 2))();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_event;
    v2->_event = (LPEvent *)v4;

    eventGenerator = v2->_eventGenerator;
    v2->_eventGenerator = 0;

    event = v2->_event;
  }
  v7 = event;
  objc_sync_exit(v2);

  return v7;
}

- (void)ensureEventWithSpecialization:(unint64_t)a3
{
  id v5;

  v5 = -[LPMetadataProviderSpecializationContext event](self, "event");
  -[LPEvent setSpecialization:](self->_event, "setSpecialization:", a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSURL)postRedirectURL
{
  return self->_postRedirectURL;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (BOOL)hasLoadedResource
{
  return self->_hasLoadedResource;
}

- (BOOL)shouldFetchSubresources
{
  return self->_shouldFetchSubresources;
}

- (BOOL)fetchIsNotUserInitiated
{
  return self->_fetchIsNotUserInitiated;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (unint64_t)allowedSpecializations
{
  return self->_allowedSpecializations;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (id)eventGenerator
{
  return self->_eventGenerator;
}

- (void)setEventGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventGenerator, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_postRedirectURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
