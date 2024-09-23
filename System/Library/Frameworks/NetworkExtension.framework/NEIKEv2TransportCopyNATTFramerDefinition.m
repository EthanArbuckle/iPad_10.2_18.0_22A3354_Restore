@implementation NEIKEv2TransportCopyNATTFramerDefinition

void __NEIKEv2TransportCopyNATTFramerDefinition_block_invoke()
{
  nw_protocol_definition_t definition;
  void *v1;

  definition = nw_framer_create_definition("UDP-NAT-T", 0, &__block_literal_global_3_12867);
  v1 = (void *)NEIKEv2TransportCopyNATTFramerDefinition_definition;
  NEIKEv2TransportCopyNATTFramerDefinition_definition = (uint64_t)definition;

}

uint64_t __NEIKEv2TransportCopyNATTFramerDefinition_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v2;

  v2 = a2;
  nw_framer_set_input_handler(v2, &__block_literal_global_5_12869);
  nw_framer_set_output_handler(v2, &__block_literal_global_9_12870);

  return 1;
}

void __NEIKEv2TransportCopyNATTFramerDefinition_block_invoke_7(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  size_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  nw_framer_write_output(v5, _block_invoke_nonESPMarker, 4uLL);
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134217984;
    v8 = a4;
    _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "UDP-NAT-T: Writing frame length %zu for NAT-T", (uint8_t *)&v7, 0xCu);
  }

  nw_framer_write_output_no_copy(v5, a4);
}

uint64_t __NEIKEv2TransportCopyNATTFramerDefinition_block_invoke_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _QWORD parse[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    parse[0] = v3;
    parse[1] = 3221225472;
    parse[2] = __NEIKEv2TransportCopyNATTFramerDefinition_block_invoke_4;
    parse[3] = &unk_1E3CC19E0;
    parse[4] = &v16;
    parse[5] = &v12;
    if (!nw_framer_parse_input(v2, 1uLL, 0xFFFFFFFFuLL, 0, parse))
      break;
    if (v13[3])
    {
      if (*((_DWORD *)v17 + 6))
      {
        ne_log_obj();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v8 = v13[3];
          v9 = bswap32(*((_DWORD *)v17 + 6));
          *(_DWORD *)buf = 134218240;
          v21 = v8;
          v22 = 1024;
          v23 = v9;
          _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "UDP-NAT-T: Reading frame length %zu for NAT-T, unexpected non-zero marker %04X", buf, 0x12u);
        }
      }
      else
      {
        ne_log_obj();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          v7 = v13[3];
          *(_DWORD *)buf = 134217984;
          v21 = v7;
          _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "UDP-NAT-T: Reading frame length %zu for NAT-T", buf, 0xCu);
        }
      }

      v5 = nw_framer_message_create(v2);
      v6 = nw_framer_deliver_input_no_copy(v2, v13[3], v5, 1);

      if (!v6)
        break;
    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return 0;
}

uint64_t __NEIKEv2TransportCopyNATTFramerDefinition_block_invoke_4(uint64_t a1, _DWORD *a2, unint64_t a3, int a4)
{
  unint64_t v4;

  v4 = 0;
  if (a2)
  {
    if (a4)
    {
      v4 = a3;
      if (a3 >= 4)
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *a2;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 - 4;
        return 4;
      }
    }
  }
  return v4;
}

@end
