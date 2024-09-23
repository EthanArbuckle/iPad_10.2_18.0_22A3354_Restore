@implementation AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest

id __AMSFraudReportAddDeviceIdentityCertificateAndSignatureToRequest_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-FSR-Signature"));

    +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", v8, CFSTR("X-Mme-Device-Id"));

  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
