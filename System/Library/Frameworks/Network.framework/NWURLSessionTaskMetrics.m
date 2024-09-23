@implementation NWURLSessionTaskMetrics

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionTaskMetrics;
  if (-[NWURLSessionTaskMetrics isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (NSArray)transactionMetrics
{
  id v3;
  OS_nw_protocol_metadata *clientMetadata;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  NWURLSessionTaskMetrics *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
    clientMetadata = self->_clientMetadata;
  else
    clientMetadata = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __45__NWURLSessionTaskMetrics_transactionMetrics__block_invoke;
  v11 = &unk_1E149EDD8;
  v12 = self;
  v13 = v3;
  v5 = v3;
  nw_http_client_metadata_enumerate_transactions(clientMetadata, &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

- (NSDateInterval)taskInterval
{
  uint64_t start_time;
  uint64_t end_time;
  OS_nw_protocol_metadata *clientMetadata;
  void *v6;
  uint64_t v7;
  void *v8;

  if (self)
  {
    start_time = nw_http_client_metadata_get_start_time(self->_clientMetadata);
    end_time = nw_http_client_metadata_get_end_time(self->_clientMetadata);
    clientMetadata = self->_clientMetadata;
  }
  else
  {
    start_time = nw_http_client_metadata_get_start_time(0);
    end_time = nw_http_client_metadata_get_end_time(0);
    clientMetadata = 0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", nw_http_client_metadata_convert_time_to_absolute(clientMetadata, start_time));
  if (!end_time)
  {
    v7 = mach_continuous_time();
    if (v7 <= 1)
      end_time = 1;
    else
      end_time = v7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v6, (double)(unint64_t)nw_delta_nanos(start_time, end_time) * 0.000000001);

  return (NSDateInterval *)v8;
}

- (unint64_t)redirectCount
{
  OS_nw_protocol_metadata *clientMetadata;
  OS_nw_protocol_metadata *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    clientMetadata = self->_clientMetadata;
  else
    clientMetadata = 0;
  v3 = clientMetadata;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__NWURLSessionTaskMetrics_redirectCount__block_invoke;
  v6[3] = &unk_1E149EE00;
  v6[4] = &v7;
  nw_http_client_metadata_enumerate_transactions(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetadata, 0);
}

uint64_t __40__NWURLSessionTaskMetrics_redirectCount__block_invoke(uint64_t a1, void *a2)
{
  if (nw_http_transaction_metadata_get_start_reason(a2) == 1)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

uint64_t __45__NWURLSessionTaskMetrics_transactionMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NWURLSessionTaskTransactionMetrics *v4;
  uint64_t v5;
  void *v6;
  id *v7;

  v3 = a2;
  v4 = [NWURLSessionTaskTransactionMetrics alloc];
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 16);
  else
    v6 = 0;
  v7 = -[NWURLSessionTaskTransactionMetrics initWithTransactionMetadata:clientMetadata:]((id *)&v4->super.super.isa, v3, v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  return 1;
}

uint64_t __53__NWURLSessionTaskMetrics_reportToSymptoms_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int start_reason;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t outbound_message_start_time;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t outbound_message_end_time;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t inbound_message_start_time;
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t inbound_message_end_time;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t outbound_header_size;
  uint64_t inbound_header_size;
  id connection_metadata;
  void *v29;
  uint64_t v30;
  unsigned int version;
  id establishment_report;
  void *v33;
  _BYTE *v34;
  char v35;
  uint64_t v36;
  id inbound_message;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  char *v46;
  id v47;
  void *v48;
  int v49;
  uint64_t v50;

  v3 = a2;
  start_reason = nw_http_transaction_metadata_get_start_reason(v3);
  if (start_reason == 3)
  {
    v6 = a1 + 56;
  }
  else
  {
    if (start_reason != 1)
      goto LABEL_8;
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v5)
      *(_BYTE *)(*(_QWORD *)(a1 + 64) + 120 * v5 + 77) = 1;
    v6 = a1 + 48;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24);
LABEL_8:
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  outbound_message_start_time = nw_http_transaction_metadata_get_outbound_message_start_time(v3);
  if (outbound_message_start_time)
  {
    v10 = outbound_message_start_time;
    v11 = dword_1ECD84D64;
    if (!dword_1ECD84D64)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      v11 = dword_1ECD84D64;
    }
    v12 = v10 * (unint64_t)time_base / v11 / 0xF4240 - *(_QWORD *)(a1 + 72);
  }
  else
  {
    v12 = 0;
  }
  *(_QWORD *)(v7 + 120 * v8 + 104) = v12;
  outbound_message_end_time = nw_http_transaction_metadata_get_outbound_message_end_time(v3);
  if (outbound_message_end_time)
  {
    v14 = outbound_message_end_time;
    v15 = dword_1ECD84D64;
    if (!dword_1ECD84D64)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      v15 = dword_1ECD84D64;
    }
    v16 = v14 * (unint64_t)time_base / v15 / 0xF4240 - *(_QWORD *)(a1 + 72);
  }
  else
  {
    v16 = 0;
  }
  *(_QWORD *)(v7 + 120 * v8 + 112) = v16;
  inbound_message_start_time = nw_http_transaction_metadata_get_inbound_message_start_time(v3);
  if (inbound_message_start_time)
  {
    v18 = inbound_message_start_time;
    v19 = dword_1ECD84D64;
    if (!dword_1ECD84D64)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      v19 = dword_1ECD84D64;
    }
    v20 = v18 * (unint64_t)time_base / v19 / 0xF4240 - *(_QWORD *)(a1 + 72);
  }
  else
  {
    v20 = 0;
  }
  *(_QWORD *)(v7 + 120 * v8 + 120) = v20;
  inbound_message_end_time = nw_http_transaction_metadata_get_inbound_message_end_time(v3);
  if (inbound_message_end_time)
  {
    v22 = inbound_message_end_time;
    v23 = dword_1ECD84D64;
    if (!dword_1ECD84D64)
    {
      mach_timebase_info((mach_timebase_info_t)&time_base);
      v23 = dword_1ECD84D64;
    }
    v24 = v22 * (unint64_t)time_base / v23 / 0xF4240 - *(_QWORD *)(a1 + 72);
  }
  else
  {
    v24 = 0;
  }
  v25 = (_QWORD *)(v7 + 120 * v8);
  v25[16] = v24;
  outbound_header_size = nw_http_transaction_metadata_get_outbound_header_size(v3);
  v25[17] = nw_http_transaction_metadata_get_outbound_body_transfer_size(v3) + outbound_header_size;
  inbound_header_size = nw_http_transaction_metadata_get_inbound_header_size(v3);
  v25[18] = nw_http_transaction_metadata_get_inbound_body_transfer_size(v3) + inbound_header_size;
  connection_metadata = nw_http_transaction_metadata_get_connection_metadata(v3);
  v29 = connection_metadata;
  if (connection_metadata)
  {
    v30 = v7 + 120 * v8;
    nw_http_connection_metadata_get_uuid(connection_metadata, v30 + 152);
    *(_BYTE *)(v30 + 196) = !nw_http_transaction_metadata_is_first_on_connection(v3);
    version = nw_http_connection_metadata_get_version(v29);
    if (version <= 5 && ((0x39u >> version) & 1) != 0)
      *(_DWORD *)(v7 + 120 * v8 + 192) = dword_183BA8D5C[version];
    establishment_report = nw_http_connection_metadata_get_establishment_report(v29);
    v33 = establishment_report;
    if (establishment_report)
    {
      v34 = establishment_report;
      v35 = v34[84];

      *(_BYTE *)(v7 + 120 * v8 + 198) = (v35 & 2) != 0;
    }

  }
  else
  {
    *(_DWORD *)(v7 + 120 * v8 + 192) = 1;
  }
  v36 = v7 + 120 * v8;
  *(int64x2_t *)(v36 + 168) = vdupq_n_s64(1uLL);
  *(_QWORD *)(v36 + 184) = 2;
  inbound_message = nw_http_transaction_metadata_get_inbound_message(v3);
  v38 = inbound_message;
  if (inbound_message)
  {
    v39 = nw_http_metadata_copy_response(inbound_message);
    v40 = v39;
    if (!v39)
    {
      v43 = 1;
      goto LABEL_80;
    }
    v41 = v39;
    v42 = (void *)_nw_http_fields_copy_value_by_name();

    if (v42)
    {
      v43 = 6;
LABEL_79:
      free(v42);
      goto LABEL_80;
    }
    v44 = v41;
    v42 = (void *)_nw_http_fields_copy_value_by_name();

    if (v42)
    {
      v43 = 3;
      goto LABEL_79;
    }
    v45 = v44;
    v46 = (char *)_nw_http_fields_copy_value_by_name();

    if (v46 && strcasestr(v46, "CloudFront"))
    {
      v42 = 0;
      v43 = 5;
      goto LABEL_78;
    }
    v47 = v45;
    v42 = (void *)_nw_http_fields_copy_value_by_name();

    if (v42)
    {
      if (strcasestr((const char *)v42, "gws")
        || strcasestr((const char *)v42, "GSE")
        || strcasestr((const char *)v42, "ESF"))
      {
        v43 = 2;
        if (!v46)
          goto LABEL_79;
LABEL_78:
        free(v46);
        if (v42)
          goto LABEL_79;
LABEL_80:

        *(_QWORD *)(v7 + 120 * v8 + 200) = v43;
        objc_msgSend(*(id *)(a1 + 32), "response");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v49 = objc_msgSend(v48, "statusCode");
        else
          v49 = 0;
        *(_DWORD *)(v7 + 120 * v8 + 220) = v49;

        goto LABEL_84;
      }
      if (strcasestr((const char *)v42, "cloudflare"))
      {
        v43 = 4;
        if (!v46)
          goto LABEL_79;
        goto LABEL_78;
      }
      if (strcasestr((const char *)v42, "ApacheTrafficServer") || strcasestr((const char *)v42, "ATS"))
      {
        v43 = 7;
        if (!v46)
          goto LABEL_79;
        goto LABEL_78;
      }
      if (strcasestr((const char *)v42, "apache"))
      {
        v43 = 8;
        if (!v46)
          goto LABEL_79;
        goto LABEL_78;
      }
      if (strcasestr((const char *)v42, "nginx"))
      {
        v43 = 9;
        if (!v46)
          goto LABEL_79;
        goto LABEL_78;
      }
      if (strcasestr((const char *)v42, "LiteSpeed"))
      {
        v43 = 10;
        if (!v46)
          goto LABEL_79;
        goto LABEL_78;
      }
      if (strcasestr((const char *)v42, "lighttpd"))
      {
        v43 = 11;
        if (!v46)
          goto LABEL_79;
        goto LABEL_78;
      }
      if (strcasestr((const char *)v42, "nghttpx"))
      {
        v43 = 12;
        if (!v46)
          goto LABEL_79;
        goto LABEL_78;
      }
    }
    if (!v46)
    {
      v43 = 1;
      if (!v42)
        goto LABEL_80;
      goto LABEL_79;
    }
    if (strcasestr(v46, "varnish"))
      v43 = 13;
    else
      v43 = 1;
    goto LABEL_78;
  }
LABEL_84:
  v50 = v7 + 120 * v8;
  *(_QWORD *)(v50 + 208) = 0;
  *(_BYTE *)(v50 + 216) = 0;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return 1;
}

uint64_t __53__NWURLSessionTaskMetrics_reportToSymptoms_activity___block_invoke_2()
{
  uint64_t result;

  result = symptom_framework_init();
  reportToSymptoms_activity__symptomReporter = result;
  return result;
}

@end
