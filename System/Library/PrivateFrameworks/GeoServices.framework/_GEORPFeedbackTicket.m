@implementation _GEORPFeedbackTicket

- (_GEORPFeedbackTicket)initWithFeedbackRequest:(id)a3 traits:(id)a4
{
  id v7;
  _GEORPFeedbackTicket *v8;
  _GEORPFeedbackTicket *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEORPFeedbackTicket;
  v8 = -[GEOAbstractTicket initWithTraits:](&v11, sel_initWithTraits_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_feedbackRequest, a3);

  return v9;
}

- (_GEORPFeedbackTicket)initWithFeedbackRequestData:(id)a3 traits:(id)a4
{
  id v6;
  _GEORPFeedbackTicket *v7;
  uint64_t v8;
  NSData *resubmissionData;
  GEORPFeedbackRequest *v10;
  GEORPFeedbackRequest *feedbackRequest;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GEORPFeedbackTicket;
  v7 = -[GEOAbstractTicket initWithTraits:](&v13, sel_initWithTraits_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    resubmissionData = v7->_resubmissionData;
    v7->_resubmissionData = (NSData *)v8;

    v10 = -[GEORPFeedbackRequest initWithData:]([GEORPFeedbackRequest alloc], "initWithData:", v6);
    feedbackRequest = v7->_feedbackRequest;
    v7->_feedbackRequest = v10;

  }
  return v7;
}

- (_GEORPFeedbackTicket)initWithFeedbackRequestParameters:(id)a3 placeForProblemContext:(id)a4 userCredentials:(id)a5 pushToken:(id)a6 allowContactBackAtEmailAddress:(id)a7 traits:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _GEORPFeedbackTicket *v20;
  _GEORPFeedbackTicket *v21;
  id *p_feedbackRequestParameters;
  id *p_place;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  GEOLatLng *v34;
  GEOLatLng *emailAddress;
  void *v36;
  uint64_t v37;
  GEORPUserCredentials *userCredentials;
  uint64_t v39;
  NSData *pushToken;
  uint64_t v41;
  void *v43;
  id v44;
  objc_super v45;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v45.receiver = self;
  v45.super_class = (Class)_GEORPFeedbackTicket;
  v20 = -[GEOAbstractTicket initWithTraits:](&v45, sel_initWithTraits_, a8);
  v21 = v20;
  if (v20)
  {
    p_feedbackRequestParameters = (id *)&v20->_feedbackRequestParameters;
    objc_storeStrong((id *)&v20->_feedbackRequestParameters, a3);
    p_place = (id *)&v21->_place;
    objc_storeStrong((id *)&v21->_place, a4);
    if (objc_msgSend(*p_feedbackRequestParameters, "hasLayoutConfigParameters"))
    {
      objc_msgSend(*p_place, "_placeData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "mapsId");
      v44 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_feedbackRequestParameters, "layoutConfigParameters");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMapsId:", v25);

      objc_msgSend(*p_place, "_placeData");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "geoMapItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "displayMapRegion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_feedbackRequestParameters, "layoutConfigParameters");
      v29 = v19;
      v30 = v18;
      v31 = v17;
      v32 = v15;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setMapRegion:", v28);

      v15 = v32;
      v17 = v31;
      v18 = v30;
      v19 = v29;

      v16 = v44;
      v34 = [GEOLatLng alloc];
      objc_msgSend(*p_place, "centerCoordinate");
      emailAddress = -[GEOLatLng initWithCoordinate:](v34, "initWithCoordinate:");
      objc_msgSend(*p_feedbackRequestParameters, "layoutConfigParameters");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setCoordinate:", emailAddress);

LABEL_6:
      goto LABEL_7;
    }
    if (objc_msgSend(*p_feedbackRequestParameters, "hasSubmissionParameters"))
    {
      v37 = objc_msgSend(v17, "copy");
      userCredentials = v21->_userCredentials;
      v21->_userCredentials = (GEORPUserCredentials *)v37;

      v39 = objc_msgSend(v18, "copy");
      pushToken = v21->_pushToken;
      v21->_pushToken = (NSData *)v39;

      v41 = objc_msgSend(v19, "copy");
      emailAddress = (GEOLatLng *)v21->_emailAddress;
      v21->_emailAddress = (NSString *)v41;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v21;
}

- (void)cancel
{
  void *v3;
  GEORPFeedbackRequest *feedbackRequest;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GEORPFeedbackTicket;
  -[GEOAbstractTicket cancel](&v5, sel_cancel);
  if (self->_feedbackRequest)
  {
    +[GEORPFeedbackRequester sharedInstance](GEORPFeedbackRequester, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", self->_feedbackRequest);

    feedbackRequest = self->_feedbackRequest;
    self->_feedbackRequest = 0;

  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v5;
  BOOL v6;
  GEORPFeedbackRequest *v7;
  GEORPFeedbackRequest *feedbackRequest;
  void *v9;
  GEORPFeedbackRequest *v10;
  GEOMapServiceTraits *traits;
  void *v12;
  _QWORD v13[5];
  id v14;

  v5 = a3;
  v6 = -[GEOAbstractTicket isCancelled](self, "isCancelled");
  if (v5 && !v6 && !self->_started)
  {
    self->_started = 1;
    if (!self->_feedbackRequest)
    {
      if (!self->_feedbackRequestParameters)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v12);

        goto LABEL_8;
      }
      v7 = -[GEORPFeedbackRequest initWithFeedbackRequestParameters:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:]([GEORPFeedbackRequest alloc], "initWithFeedbackRequestParameters:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:", self->_feedbackRequestParameters, self->_userCredentials, self->_pushToken, self->_emailAddress, self->super._traits);
      feedbackRequest = self->_feedbackRequest;
      self->_feedbackRequest = v7;

    }
    +[GEORPFeedbackRequester sharedInstance](GEORPFeedbackRequester, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_feedbackRequest;
    traits = self->super._traits;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58___GEORPFeedbackTicket_submitWithHandler_networkActivity___block_invoke;
    v13[3] = &unk_1E1C06B68;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v9, "startWithRequest:traits:completionHandler:", v10, traits, v13);

  }
LABEL_8:

}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)2853;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_feedbackRequest, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_feedbackRequestParameters, 0);
  objc_storeStrong((id *)&self->_resubmissionData, 0);
}

@end
