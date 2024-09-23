@implementation SHMutableSignature

- (SHSpectralOutputConfiguration)spectralOutputConfiguration
{
  return self->_spectralOutputConfiguration;
}

- (void)setSpectralOutputConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_spectralOutputConfiguration, a3);
}

- (SHMutableSignature)init
{
  return -[SHMutableSignature initWithMaximumSeconds:clipStyle:](self, "initWithMaximumSeconds:clipStyle:", 0, 36000.0);
}

- (SHMutableSignature)initWithMaximumSeconds:(double)a3 clipStyle:(int64_t)a4
{
  void *v7;
  void *v8;
  SHMutableSignature *v9;
  double v10;
  id v12;
  objc_super v13;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Signature maximum duration must be greater than zero"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SHMutableSignature;
  v9 = -[SHSignature initWithID:dataRepresentation:startTime:error:](&v13, sel_initWithID_dataRepresentation_startTime_error_, v7, v8, 0, 0);

  if (v9)
  {
    v10 = 36000.0;
    if (a3 <= 36000.0)
      v10 = a3;
    v9->_maximumSeconds = v10;
    v9->_clipStyle = a4;
  }
  return v9;
}

- (SHMutableSignature)initWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5 error:(id *)a6
{
  SHMutableSignature *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHMutableSignature;
  result = -[SHSignature initWithID:dataRepresentation:startTime:error:](&v7, sel_initWithID_dataRepresentation_startTime_error_, a3, a4, a5, a6);
  if (result)
  {
    result->_maximumSeconds = 36000.0;
    result->_clipStyle = 0;
  }
  return result;
}

- (SHMutableSignature)initWithCoder:(id)a3
{
  id v4;
  SHMutableSignature *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHMutableSignature;
  v5 = -[SHSignature initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SHMutableSignatureCodingMaximumSeconds"));
    v5->_maximumSeconds = v6;
    v5->_clipStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SHMutableSignatureCodingClipStyle"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SHMutableSignature;
  -[SHSignature encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[SHMutableSignature clipStyle](self, "clipStyle"), CFSTR("SHMutableSignatureCodingClipStyle"));
  -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SHMutableSignatureCodingMaximumSeconds"));

}

- (BOOL)updateRingBufferDuration:(double)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  NSObject *v25;
  uint8_t v26[16];

  if (-[SHMutableSignature clipStyle](self, "clipStyle") != 1)
  {
    sh_log_object();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_218BF1000, v25, OS_LOG_TYPE_ERROR, "Can't update mutable signature duration as the clip style is not OLD", v26, 2u);
    }

    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 500, 0);
    return 0;
  }
  -[SHMutableSignature sigX](self, "sigX");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SHMutableSignature sigX](self, "sigX");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = a3;
    v11 = objc_msgSend(v9, "setRollingBufferSeconds:error:", a4, v10);

    if (!v11)
      return 0;
  }
  -[SHMutableSignature duration](self, "duration");
  if (v12 > a3)
  {
    -[SHMutableSignature duration](self, "duration");
    v14 = v13;
    -[SHMutableSignature format](self, "format");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sampleRate");
    v17 = v16;

    v18 = objc_alloc(MEMORY[0x24BDB1880]);
    -[SHSignature time](self, "time");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "sampleTime");
    -[SHMutableSignature format](self, "format");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sampleRate");
    v22 = ((v14 - a3) * v17);
    v23 = (void *)objc_msgSend(v18, "initWithSampleTime:atRate:", v20 + v22);
    -[SHSignature setTime:](self, "setTime:", v23);

    -[SHMutableSignature setCurrentFrameCount:](self, "setCurrentFrameCount:", -[SHMutableSignature currentFrameCount](self, "currentFrameCount") - v22);
  }
  self->_maximumSeconds = a3;
  return 1;
}

- (int)signatureType
{
  if (-[SHMutableSignature clipStyle](self, "clipStyle") == 1)
    return 4;
  else
    return 2;
}

- (void)configureWithFormat:(id)a3
{
  id v4;
  SigX *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  SigX *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SHMutableSignature setFormat:](self, "setFormat:", v4);
  v5 = [SigX alloc];
  v6 = -[SHMutableSignature signatureType](self, "signatureType");
  -[SHMutableSignature format](self, "format");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "sampleRate");
  v21 = 0;
  v9 = -[SigX initWithSignatureType:sampleRate:error:](v5, "initWithSignatureType:sampleRate:error:", v6, v8, &v21);
  v10 = v21;
  -[SHMutableSignature setSigX:](self, "setSigX:", v9);

  -[SHMutableSignature spectralOutputConfiguration](self, "spectralOutputConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = v11 == 0;

  if ((v7 & 1) == 0)
  {
    -[SHMutableSignature spectralOutputConfiguration](self, "spectralOutputConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMutableSignature enableSpectralOutputWithConfiguration:](self, "enableSpectralOutputWithConfiguration:", v12);

  }
  if (-[SHMutableSignature signatureType](self, "signatureType") == 4)
  {
    -[SHMutableSignature sigX](self, "sigX");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
    *(float *)&v14 = v14;
    v20 = v10;
    objc_msgSend(v13, "setRollingBufferSeconds:error:", &v20, v14);
    v15 = v20;

    v10 = v15;
  }
  if (v10)
  {
    sh_log_object();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_218BF1000, v16, OS_LOG_TYPE_ERROR, "SigX returned an error: %@", buf, 0xCu);
    }

    v17 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(v10, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }

}

- (void)enableSpectralOutputWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SHMutableSignature sigX](self, "sigX");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numberOfBins");
  v7 = objc_msgSend(v4, "callbackFrequency");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__SHMutableSignature_enableSpectralOutputWithConfiguration___block_invoke;
  v8[3] = &unk_24D9B7E70;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:", v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __60__SHMutableSignature_enableSpectralOutputWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "subarrayWithRange:", 1, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = CFSTR("spectralData");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("com.apple.shazamd.sigx.newspectraloutput"), WeakRetained, v7);

}

- (void)disableSpectralOutput
{
  id v2;

  -[SHMutableSignature sigX](self, "sigX");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableSpectralOutput");

}

- (id)clipExcessAudio:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  int v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[SHAudioUtilities durationOfBuffer:](SHAudioUtilities, "durationOfBuffer:", v4);
  v6 = v5;
  -[SHMutableSignature duration](self, "duration");
  v8 = v7;
  -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
  if (v6 + v8 > v9)
  {
    -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
    v11 = v10;
    -[SHMutableSignature duration](self, "duration");
    v13 = v12;
    sh_log_object();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v11 - v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = v15;
      _os_log_impl(&dword_218BF1000, v14, OS_LOG_TYPE_DEBUG, "Audio will be too long we require only %f", (uint8_t *)&v18, 0xCu);
    }

    +[SHAudioUtilities bufferHead:duration:](SHAudioUtilities, "bufferHead:duration:", v4, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v16;
  }
  return v4;
}

- (BOOL)appendBuffer:(id)a3 atTime:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int64_t v48;
  void *v49;
  int v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  unsigned int v56;
  int v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  unsigned int v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  int v67;
  NSObject *v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  NSObject *v90;
  uint64_t v91;
  NSObject *v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  uint8_t buf[4];
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SHAudioUtilities willAudioFormatCauseBufferMutation:](SHAudioUtilities, "willAudioFormatCauseBufferMutation:", v10);

  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");

    v8 = (id)v12;
  }
  objc_msgSend(v8, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[SHAudioUtilities isAudioFormatSupported:](SHAudioUtilities, "isAudioFormatSupported:", v13);

  if (!v14)
  {
    -[SHMutableSignature audioConverter](self, "audioConverter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "supportedPCMBufferFromBuffer:error:", v8, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      sh_log_object();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218BF1000, v25, OS_LOG_TYPE_ERROR, "Failed to convert input buffer to standard format", buf, 2u);
      }
      goto LABEL_37;
    }
    if (v9)
    {
      objc_msgSend(v16, "format");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sampleRate");
      if (v18 == 0.0)
      {
        v24 = 1.0;
      }
      else
      {
        objc_msgSend(v8, "format");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sampleRate");
        v21 = v20;
        objc_msgSend(v16, "format");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sampleRate");
        v24 = v21 / v23;

      }
      v26 = objc_msgSend(v9, "sampleTime");
      v27 = (void *)MEMORY[0x24BDB1880];
      objc_msgSend(v16, "format");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sampleRate");
      objc_msgSend(v27, "timeWithSampleTime:atRate:", vcvtpd_s64_f64((double)v26 / v24));
      v29 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v29;
    }

    v8 = v16;
  }
  -[SHMutableSignature format](self, "format");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    -[SHSignature setTime:](self, "setTime:", v9);
    -[SHSignature time](self, "time");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSignature _startDateBasedUponAudioTime:](self, "_startDateBasedUponAudioTime:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSignature setAudioStartDate:](self, "setAudioStartDate:", v32);

    objc_msgSend(v8, "format");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMutableSignature configureWithFormat:](self, "configureWithFormat:", v33);

  }
  objc_msgSend(v8, "format");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMutableSignature format](self, "format");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) == 0)
  {
    objc_msgSend(v8, "format");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "formatDescription");

    -[SHMutableSignature format](self, "format");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "formatDescription");

    sh_log_object();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "format");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v98 = objc_msgSend(v85, "formatDescription");
      v99 = 2112;
      v100 = v83;
      _os_log_impl(&dword_218BF1000, v84, OS_LOG_TYPE_ERROR, "Audio format mismatch %@ != %@", buf, 0x16u);

    }
    v86 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Supplied audio format %@ does not match existing format %@"), v81, v83);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v87, 0);
    v88 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v88);
  }
  +[SHAudioUtilities durationOfBuffer:](SHAudioUtilities, "durationOfBuffer:", v8);
  v38 = v37;
  -[SHMutableSignature duration](self, "duration");
  v40 = v39;
  -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
  v42 = v41;
  -[SHMutableSignature duration](self, "duration");
  v44 = v43;
  -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
  v46 = v45;
  v47 = v38 + v44;
  if (!-[SHMutableSignature clipStyle](self, "clipStyle"))
  {
    if (v40 >= v42)
    {
      sh_log_object();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218BF1000, v75, OS_LOG_TYPE_DEBUG, "Discarding audio we are at max duration with a discard behaviour", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The signature has reached the max duration"));
      v25 = objc_claimAutoreleasedReturnValue();
      v95[0] = *MEMORY[0x24BDD0FD8];
      v95[1] = CFSTR("discardedAudioDuration");
      v96[0] = v25;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v96[1] = v76;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a5, 201, 0, v77);

      goto LABEL_37;
    }
    if (v47 > v46)
    {
      -[SHMutableSignature clipExcessAudio:](self, "clipExcessAudio:", v8);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      -[SHMutableSignature sigX](self, "sigX");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "flowBuffer:error:", v65, a5);

      if (!v67)
      {
        v64 = 0;
        goto LABEL_40;
      }
      sh_log_object();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218BF1000, v68, OS_LOG_TYPE_DEBUG, "Discarding audio we are at max duration with a discard behaviour", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The signature has reached the max duration"));
      v25 = objc_claimAutoreleasedReturnValue();
      -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
      v70 = v69;
      -[SHMutableSignature duration](self, "duration");
      v93[0] = *MEMORY[0x24BDD0FD8];
      v93[1] = CFSTR("discardedAudioDuration");
      v94[0] = v25;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v38 - (v70 - v71));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v72;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a5, 201, 0, v73);

      -[SHMutableSignature setCurrentFrameCount:](self, "setCurrentFrameCount:", -[SHMutableSignature currentFrameCount](self, "currentFrameCount")+ objc_msgSend(v65, "frameLength"));
      v8 = v65;
      goto LABEL_37;
    }
  }
  if (!v9)
    goto LABEL_21;
  if ((objc_msgSend(v9, "isSampleTimeValid") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The provided time does not have a valid sample time"));
    v25 = objc_claimAutoreleasedReturnValue();
    v91 = *MEMORY[0x24BDD0FD8];
    v92 = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a5, 101, 0, v74);

LABEL_37:
    goto LABEL_38;
  }
  if (-[SHMutableSignature currentPosition](self, "currentPosition"))
  {
    v48 = -[SHMutableSignature currentPosition](self, "currentPosition");
    if (v48 != objc_msgSend(v9, "sampleTime"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current frame position %lld does not equal the sample time %lld"), -[SHMutableSignature currentPosition](self, "currentPosition"), objc_msgSend(v9, "sampleTime"));
      v25 = objc_claimAutoreleasedReturnValue();
      v89 = *MEMORY[0x24BDD0FD8];
      v90 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a5, 101, 0, v78);

      goto LABEL_37;
    }
  }
LABEL_21:
  -[SHMutableSignature sigX](self, "sigX");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "flowBuffer:error:", v8, a5);

  if (v50)
  {
    if (-[SHMutableSignature clipStyle](self, "clipStyle") == 1 && v47 > v46)
    {
      -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
      v52 = v51;
      -[SHMutableSignature format](self, "format");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "sampleRate");
      v55 = v54;

      v56 = -[SHMutableSignature currentFrameCount](self, "currentFrameCount");
      v57 = objc_msgSend(v8, "frameLength");
      v58 = objc_alloc(MEMORY[0x24BDB1880]);
      -[SHSignature time](self, "time");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "sampleTime");
      -[SHMutableSignature format](self, "format");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "sampleRate");
      v62 = v56 - (v52 * v55) + v57;
      v63 = (void *)objc_msgSend(v58, "initWithSampleTime:atRate:", v60 + v62);
      -[SHSignature setTime:](self, "setTime:", v63);

      -[SHMutableSignature setCurrentFrameCount:](self, "setCurrentFrameCount:", -[SHMutableSignature currentFrameCount](self, "currentFrameCount") - v62);
    }
    -[SHMutableSignature setCurrentFrameCount:](self, "setCurrentFrameCount:", -[SHMutableSignature currentFrameCount](self, "currentFrameCount") + objc_msgSend(v8, "frameLength"));
    v64 = 1;
    goto LABEL_39;
  }
LABEL_38:
  v64 = 0;
LABEL_39:
  v65 = v8;
LABEL_40:

  return v64;
}

- (int64_t)currentPosition
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[SHSignature time](self, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sampleTime");
  v5 = v4 + -[SHMutableSignature currentFrameCount](self, "currentFrameCount");

  return v5;
}

- (id)generate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  -[SHMutableSignature sigX](self, "sigX");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[SHMutableSignature sigX](self, "sigX");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "signatureWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v7)
    v9 = v7;
  else
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a3, 200, v8);

  return v7;
}

- (id)dataRepresentation
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  -[SHMutableSignature generate:](self, "generate:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  v5 = v4;
  if (v3)
  {
    +[SigCrop getSampleLength:error:](SigCrop, "getSampleLength:error:", v3, 0);
    v7 = v6;
    -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
    if (v7 > v8)
    {
      sh_log_object();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218BF1000, v9, OS_LOG_TYPE_ERROR, "Rolling signature buffer is over maximum seconds, cropping down to duration", buf, 2u);
      }

      -[SHMutableSignature maximumSeconds](self, "maximumSeconds");
      +[SigCrop cropSignature:atPosition:withDuration:error:](SigCrop, "cropSignature:atPosition:withDuration:error:", v3, 0, 0.0, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }
  }
  else
  {
    if (v4)
    {
      sh_log_object();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_218BF1000, v12, OS_LOG_TYPE_ERROR, "Signature generation error %@", buf, 0xCu);
      }

    }
    v14.receiver = self;
    v14.super_class = (Class)SHMutableSignature;
    -[SHSignature dataRepresentation](&v14, sel_dataRepresentation);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (double)duration
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  objc_super v10;

  if (-[SHMutableSignature currentFrameCount](self, "currentFrameCount"))
  {
    v3 = -[SHMutableSignature currentFrameCount](self, "currentFrameCount");
    -[SHMutableSignature format](self, "format");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHMutableSignature secondsFromFrameCount:forFormat:](self, "secondsFromFrameCount:forFormat:", v3, v4);
    v6 = v5;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SHMutableSignature;
    -[SHSignature dataRepresentation](&v10, sel_dataRepresentation);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SigCrop getSampleLength:error:](SigCrop, "getSampleLength:error:", v7, 0);
    v6 = v8;

  }
  return v6;
}

- (double)secondsFromFrameCount:(unsigned int)a3 forFormat:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "sampleRate");
    v8 = (double)a3 / v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (SHAudioConverter)audioConverter
{
  SHAudioConverter *audioConverter;
  SHAudioConverter *v4;
  SHAudioConverter *v5;

  audioConverter = self->_audioConverter;
  if (!audioConverter)
  {
    v4 = objc_alloc_init(SHAudioConverter);
    v5 = self->_audioConverter;
    self->_audioConverter = v4;

    audioConverter = self->_audioConverter;
  }
  return audioConverter;
}

- (double)maximumSeconds
{
  return self->_maximumSeconds;
}

- (int64_t)clipStyle
{
  return self->_clipStyle;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (SigX)sigX
{
  return self->_sigX;
}

- (void)setSigX:(id)a3
{
  objc_storeStrong((id *)&self->_sigX, a3);
}

- (unsigned)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unsigned int)a3
{
  self->_currentFrameCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigX, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_spectralOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_audioConverter, 0);
}

@end
