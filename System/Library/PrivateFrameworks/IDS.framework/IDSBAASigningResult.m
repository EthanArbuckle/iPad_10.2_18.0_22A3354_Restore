@implementation IDSBAASigningResult

- (IDSBAASigningResult)initWithResultData:(id)a3 timestamp:(id)a4 error:(id)a5
{
  return -[IDSBAASigningResult initWithResultData:timestamp:error:currentTimestampInMs:icloudDigest:icloudAltDigest:icloudResultData:icloudAltResultData:icloudError:icloudAltError:](self, "initWithResultData:timestamp:error:currentTimestampInMs:icloudDigest:icloudAltDigest:icloudResultData:icloudAltResultData:icloudError:icloudAltError:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0);
}

- (IDSBAASigningResult)initWithResultData:(id)a3 timestamp:(id)a4 error:(id)a5 currentTimestampInMs:(unint64_t)a6 icloudDigest:(id)a7 icloudAltDigest:(id)a8 icloudResultData:(id)a9 icloudAltResultData:(id)a10 icloudError:(id)a11 icloudAltError:(id)a12
{
  return -[IDSBAASigningResult initWithResultData:timestamp:error:currentTimestampInMs:icloudDigest:icloudAltDigest:icloudResultData:icloudAltResultData:icloudError:icloudAltError:hostCertChain:hostResultData:hostAltResultData:hostError:hostAltError:](self, "initWithResultData:timestamp:error:currentTimestampInMs:icloudDigest:icloudAltDigest:icloudResultData:icloudAltResultData:icloudError:icloudAltError:hostCertChain:hostResultData:hostAltResultData:hostError:hostAltError:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0, 0, 0, 0);
}

- (IDSBAASigningResult)initWithResultData:(id)a3 timestamp:(id)a4 error:(id)a5 currentTimestampInMs:(unint64_t)a6 icloudDigest:(id)a7 icloudAltDigest:(id)a8 icloudResultData:(id)a9 icloudAltResultData:(id)a10 icloudError:(id)a11 icloudAltError:(id)a12 hostCertChain:(id)a13 hostResultData:(id)a14 hostAltResultData:(id)a15 hostError:(id)a16 hostAltError:(id)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  IDSBAASigningResult *v27;
  IDSBAASigningResult *v28;
  id v31;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v31 = a4;
  v41 = a4;
  v40 = a5;
  v39 = a7;
  v33 = a8;
  v38 = a8;
  v37 = a9;
  v36 = a10;
  v35 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v26 = a17;
  v43.receiver = self;
  v43.super_class = (Class)IDSBAASigningResult;
  v27 = -[IDSBAASigningResult init](&v43, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_resultData, a3);
    objc_storeStrong((id *)&v28->_timestamp, v31);
    objc_storeStrong((id *)&v28->_error, a5);
    v28->_currentTimestampInMs = a6;
    objc_storeStrong((id *)&v28->_icloudDigest, a7);
    objc_storeStrong((id *)&v28->_icloudAltDigest, v33);
    objc_storeStrong((id *)&v28->_icloudResultData, a9);
    objc_storeStrong((id *)&v28->_icloudAltResultData, a10);
    objc_storeStrong((id *)&v28->_icloudError, a11);
    objc_storeStrong((id *)&v28->_icloudAltError, a12);
    objc_storeStrong((id *)&v28->_hostCertChain, a13);
    objc_storeStrong((id *)&v28->_hostResultData, a14);
    objc_storeStrong((id *)&v28->_hostAltResultData, a15);
    objc_storeStrong((id *)&v28->_hostError, a16);
    objc_storeStrong((id *)&v28->_hostAltError, a17);
  }

  return v28;
}

- (NSData)resultData
{
  return self->_resultData;
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)currentTimestampInMs
{
  return self->_currentTimestampInMs;
}

- (NSString)icloudDigest
{
  return self->_icloudDigest;
}

- (NSString)icloudAltDigest
{
  return self->_icloudAltDigest;
}

- (NSData)icloudResultData
{
  return self->_icloudResultData;
}

- (NSData)icloudAltResultData
{
  return self->_icloudAltResultData;
}

- (NSError)icloudError
{
  return self->_icloudError;
}

- (NSError)icloudAltError
{
  return self->_icloudAltError;
}

- (NSData)hostCertChain
{
  return self->_hostCertChain;
}

- (NSData)hostResultData
{
  return self->_hostResultData;
}

- (NSData)hostAltResultData
{
  return self->_hostAltResultData;
}

- (NSError)hostError
{
  return self->_hostError;
}

- (NSError)hostAltError
{
  return self->_hostAltError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAltError, 0);
  objc_storeStrong((id *)&self->_hostError, 0);
  objc_storeStrong((id *)&self->_hostAltResultData, 0);
  objc_storeStrong((id *)&self->_hostResultData, 0);
  objc_storeStrong((id *)&self->_hostCertChain, 0);
  objc_storeStrong((id *)&self->_icloudAltError, 0);
  objc_storeStrong((id *)&self->_icloudError, 0);
  objc_storeStrong((id *)&self->_icloudAltResultData, 0);
  objc_storeStrong((id *)&self->_icloudResultData, 0);
  objc_storeStrong((id *)&self->_icloudAltDigest, 0);
  objc_storeStrong((id *)&self->_icloudDigest, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
}

@end
