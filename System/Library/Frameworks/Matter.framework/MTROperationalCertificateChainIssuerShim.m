@implementation MTROperationalCertificateChainIssuerShim

- (MTROperationalCertificateChainIssuerShim)initWithIssuer:(id)a3
{
  id v5;
  MTROperationalCertificateChainIssuerShim *v6;
  MTROperationalCertificateChainIssuerShim *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTROperationalCertificateChainIssuerShim;
  v6 = -[MTROperationalCertificateChainIssuerShim init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nocChainIssuer, a3);
    v7->_shouldSkipAttestationCertificateValidation = 1;
  }

  return v7;
}

- (void)issueOperationalCertificateForRequest:(id)a3 attestationInfo:(id)a4 controller:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  CSRInfo *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  AttestationInfo *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  const char *v58;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;

  v8 = a3;
  v9 = a4;
  v61 = v8;
  v62 = a6;
  v10 = [CSRInfo alloc];
  objc_msgSend_csrNonce(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_csrElementsTLV(v8, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  objc_msgSend_attestationSignature(v8, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_csr(v17, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend_initWithNonce_elements_elementsSignature_csr_(v10, v24, (uint64_t)v13, v16, v20, v23);

  objc_msgSend_firmwareInfo(v9, v25, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = [AttestationInfo alloc];
  objc_msgSend_challenge(v9, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nonce(v9, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_elementsTLV(v9, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_elementsSignature(v9, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceAttestationCertificate(v9, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_productAttestationIntermediateCertificate(v9, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_certificationDeclaration(v9, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend_initWithChallenge_nonce_elements_elementsSignature_dac_pai_certificationDeclaration_firmwareInfo_(v30, v52, (uint64_t)v33, v36, v39, v42, v45, v48, v51, v29);

  objc_msgSend_nocChainIssuer(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = sub_233D520A8;
  v63[3] = &unk_2504F4A30;
  v57 = v62;
  v64 = v57;
  objc_msgSend_onNOCChainGenerationNeeded_attestationInfo_onNOCChainGenerationComplete_(v56, v58, (uint64_t)v60, v53, v63);

}

- (MTRNOCChainIssuer)nocChainIssuer
{
  return self->_nocChainIssuer;
}

- (BOOL)shouldSkipAttestationCertificateValidation
{
  return self->_shouldSkipAttestationCertificateValidation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nocChainIssuer, 0);
}

@end
