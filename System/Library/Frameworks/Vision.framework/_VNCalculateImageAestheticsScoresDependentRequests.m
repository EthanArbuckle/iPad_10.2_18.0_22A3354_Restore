@implementation _VNCalculateImageAestheticsScoresDependentRequests

- (_VNCalculateImageAestheticsScoresDependentRequests)initWithRevision:(unint64_t)a3 error:(id *)a4
{
  _VNCalculateImageAestheticsScoresDependentRequests *v5;
  VNClassifyImageAestheticsRequest *v6;
  VNClassifyImageAestheticsRequest *oldAestheticsRequest;
  VNClassifyJunkImageRequest *v8;
  VNClassifyJunkImageRequest *junkRequest;
  _VNCalculateImageAestheticsScoresDependentRequests *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_VNCalculateImageAestheticsScoresDependentRequests;
  v5 = -[_VNCalculateImageAestheticsScoresDependentRequests init](&v12, sel_init, a3, a4);
  if (!v5)
    goto LABEL_5;
  v6 = objc_alloc_init(VNClassifyImageAestheticsRequest);
  oldAestheticsRequest = v5->_oldAestheticsRequest;
  v5->_oldAestheticsRequest = v6;

  v8 = objc_alloc_init(VNClassifyJunkImageRequest);
  junkRequest = v5->_junkRequest;
  v5->_junkRequest = v8;

  if (a3 != 1)
    goto LABEL_6;
  if (-[VNRequest setRevision:error:](v5->_oldAestheticsRequest, "setRevision:error:", 3737841667, 0)
    && -[VNRequest setRevision:error:](v5->_junkRequest, "setRevision:error:", 3737841669, 0))
  {
LABEL_5:
    v10 = v5;
  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (id)requests
{
  VNClassifyJunkImageRequest *junkRequest;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  junkRequest = self->_junkRequest;
  v4[0] = self->_oldAestheticsRequest;
  v4[1] = junkRequest;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VNClassifyImageAestheticsRequest)oldAestheticsRequest
{
  return (VNClassifyImageAestheticsRequest *)objc_getProperty(self, a2, 8, 1);
}

- (VNClassifyJunkImageRequest)junkRequest
{
  return (VNClassifyJunkImageRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junkRequest, 0);
  objc_storeStrong((id *)&self->_oldAestheticsRequest, 0);
}

@end
