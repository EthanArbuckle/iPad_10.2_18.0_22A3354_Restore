@implementation PHASEEnvelopeDistanceModelParameters

- (PHASEEnvelopeDistanceModelParameters)init
{
  -[PHASEEnvelopeDistanceModelParameters doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEEnvelopeDistanceModelParameters)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEEnvelopeDistanceModelParameters)initWithEnvelope:(PHASEEnvelope *)envelope
{
  PHASEEnvelope *v5;
  id *v6;
  Phase::Logger *v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  Phase::Logger *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  PHASEEnvelopeDistanceModelParameters *v16;
  unint64_t i;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  double v22;
  _BOOL4 v23;
  Phase::Logger *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  _BOOL4 v31;
  Phase::Logger *v32;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _DWORD v46[7];

  *(_QWORD *)&v46[5] = *MEMORY[0x24BDAC8D0];
  v5 = envelope;
  v40.receiver = self;
  v40.super_class = (Class)PHASEEnvelopeDistanceModelParameters;
  v6 = -[PHASEDistanceModelParameters initInternal](&v40, sel_initInternal);
  if (v6)
  {
    v7 = (Phase::Logger *)-[PHASEEnvelope startPoint](v5, "startPoint");
    if (v8 >= 0.0)
    {
      v11 = (Phase::Logger *)-[PHASEEnvelope startPoint](v5, "startPoint");
      if (v12 >= 0.0
        && (v11 = (Phase::Logger *)-[PHASEEnvelope startPoint](v5, "startPoint", v12), v14 = v13, v13 <= 1.0))
      {
        for (i = 0; ; ++i)
        {
          -[PHASEEnvelope segments](v5, "segments", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count") > i;

          if (!v19)
          {
            objc_storeStrong(v6 + 2, envelope);
            goto LABEL_18;
          }
          -[PHASEEnvelope segments](v5, "segments");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", i);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "endPoint");
          v23 = v22 < 0.0;

          if (v23)
            break;
          -[PHASEEnvelope segments](v5, "segments");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", i);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "endPoint");
          if (v27 < 0.0)
          {

LABEL_24:
            v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v32)
                                                                                               + 432)));
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              -[PHASEEnvelope segments](v5, "segments");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectAtIndexedSubscript:", i);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "endPoint");
              *(_DWORD *)buf = 136315906;
              v42 = "PHASEDistanceModel.mm";
              v43 = 1024;
              v44 = 192;
              v45 = 1024;
              v46[0] = i;
              LOWORD(v46[1]) = 2048;
              *(_QWORD *)((char *)&v46[1] + 2) = v39;
              _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.segments[%d].endPoint.y (%f) is out-of-range [0, 1]. Returning nil.", buf, 0x22u);

            }
            goto LABEL_10;
          }
          -[PHASEEnvelope segments](v5, "segments", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "endPoint");
          v31 = v30 > 1.0;

          if (v31)
            goto LABEL_24;
        }
        v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v24)
                                                                                           + 432)));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          -[PHASEEnvelope segments](v5, "segments");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", i);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "endPoint");
          *(_DWORD *)buf = 136315906;
          v42 = "PHASEDistanceModel.mm";
          v43 = 1024;
          v44 = 182;
          v45 = 1024;
          v46[0] = i;
          LOWORD(v46[1]) = 2048;
          *(_QWORD *)((char *)&v46[1] + 2) = v36;
          _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.segments[%d].endPoint.x (%f) is negative. Returning nil.", buf, 0x22u);

        }
      }
      else
      {
        v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v11)
                                                                                           + 432)));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          -[PHASEEnvelope startPoint](v5, "startPoint");
          *(_DWORD *)buf = 136315650;
          v42 = "PHASEDistanceModel.mm";
          v43 = 1024;
          v44 = 170;
          v45 = 2048;
          *(_QWORD *)v46 = v15;
          _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.startPoint.y (%f) is out-of-range [0, 1]. Returning nil.", buf, 0x1Cu);
        }
      }
    }
    else
    {
      v9 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                         + 432)));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[PHASEEnvelope startPoint](v5, "startPoint");
        *(_DWORD *)buf = 136315650;
        v42 = "PHASEDistanceModel.mm";
        v43 = 1024;
        v44 = 160;
        v45 = 2048;
        *(_QWORD *)v46 = v10;
        _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEEnvelopeDistanceModelParameters:initWithEnvelope: envelope.startPoint.x (%f) is negative. Returning nil.", buf, 0x1Cu);
      }
    }
LABEL_10:

    v16 = 0;
  }
  else
  {
LABEL_18:
    v16 = v6;
  }

  return v16;
}

- (PHASEEnvelope)envelope
{
  return self->_envelope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_envelope, 0);
}

@end
