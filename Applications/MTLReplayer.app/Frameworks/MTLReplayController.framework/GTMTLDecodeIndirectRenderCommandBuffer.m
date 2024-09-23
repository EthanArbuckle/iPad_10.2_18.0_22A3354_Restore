@implementation GTMTLDecodeIndirectRenderCommandBuffer

void __GTMTLDecodeIndirectRenderCommandBuffer_block_invoke_34(id a1)
{
  id v1;
  NSObject *v2;
  FILE *v3;
  id v4;
  uint8_t buf[16];

  if (s_logUsingOsLog)
  {
    v1 = gt_default_log();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "warning: Cannot decode ICB mesh buffer binding, missing SPI", buf, 2u);
    }

  }
  else
  {
    v3 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("warning: Cannot decode ICB mesh buffer binding, missing SPI"))));
    fprintf(v3, "%s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
}

void __GTMTLDecodeIndirectRenderCommandBuffer_block_invoke(id a1)
{
  id v1;
  NSObject *v2;
  FILE *v3;
  id v4;
  uint8_t buf[16];

  if (s_logUsingOsLog)
  {
    v1 = gt_default_log();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "warning: Cannot decode ICB object buffer binding, missing SPI", buf, 2u);
    }

  }
  else
  {
    v3 = __stderrp;
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("warning: Cannot decode ICB object buffer binding, missing SPI"))));
    fprintf(v3, "%s\n", (const char *)objc_msgSend(v4, "UTF8String"));

  }
}

@end
