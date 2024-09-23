@implementation ZN2CA3OGLL22update

void *___ZN2CA3OGLL22update_perf_hud_pstateEPNS0_14PerformanceHUDEj_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/usr/local/lib/libpstatemonitor.dylib", 2);
  if (result)
  {
    v1 = result;
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_connect = (uint64_t (*)(_QWORD, _QWORD))dlsym(result, "pstate_monitor_connect");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_destroy = (uint64_t (*)(void))dlsym(v1, "pstate_monitor_destroy");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_cpu = (float (*)(void))dlsym(v1, "pstate_monitor_get_CPU_pstate");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_gpu = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_GPU_pstate");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_soc = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_SOC_pstate");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_dram = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_DRAM_pstate");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_cpu_watts = (float (*)(void))dlsym(v1, "pstate_monitor_get_CPU_watts");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_gpu_watts = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_GPU_watts");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_soc_watts = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_SOC_watts");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_dram_watts = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_DRAM_watts");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_isp_watts = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_ISP_watts");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_ap_watts = (float (*)(_QWORD))dlsym(v1, "pstate_monitor_get_AP_watts");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_batterydrain_watts = (float (*)(_QWORD, float))dlsym(v1, "pstate_monitor_get_BatteryDrain_watts");
    result = dlsym(v1, "pstate_monitor_get_LostPerf_ratio");
    CA::OGL::update_perf_hud_pstate(CA::OGL::PerformanceHUD *,unsigned int)::pstate_get_lostperf_ratio = (float (*)(_QWORD))result;
  }
  return result;
}

@end
