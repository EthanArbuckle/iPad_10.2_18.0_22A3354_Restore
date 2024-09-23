@implementation ZN2re11TraceServer18removeDirectClientEPNS

re::TraceServer *___ZN2re11TraceServer18removeDirectClientEPNS_17TraceDirectClientE_block_invoke(uint64_t a1)
{
  re::TraceServer *result;
  re::TraceServer *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t buf[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = *((_QWORD *)result + 3);
      v6 = *(_QWORD **)(v5 + 48);
      v7 = *(_QWORD *)(v5 + 32);
      v8 = v6;
      if (v7)
      {
        v9 = 8 * v7;
        v8 = *(_QWORD **)(v5 + 48);
        while (*v8 != v4)
        {
          ++v8;
          v9 -= 8;
          if (!v9)
          {
            v8 = &v6[v7];
            break;
          }
        }
      }
      v10 = v8 - v6;
      if (v10 != v7)
      {
        if (v7 <= v10)
        {
          v15 = 0u;
          v16 = 0u;
          v13 = 0u;
          v14 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
        }
        if (v7 - 1 > v10)
          v6[v10] = v6[v7 - 1];
        *(_QWORD *)(v5 + 32) = v7 - 1;
        ++*(_DWORD *)(v5 + 40);
      }
    }
    else
    {
      v11 = *re::traceLogObjects(result);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
      }
    }
    return (re::TraceServer *)re::TraceServer::tryClearDeltas(v3);
  }
  return result;
}

@end
