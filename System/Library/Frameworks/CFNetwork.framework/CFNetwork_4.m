int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1E0C836B8](a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1E0C836C8](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1E0C83708](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

uint64_t getnameinfo_async_handle_reply()
{
  return MEMORY[0x1E0C83710]();
}

uint64_t getnameinfo_async_start()
{
  return MEMORY[0x1E0C83718]();
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83748](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

protoent *__cdecl getprotobyname(const char *a1)
{
  return (protoent *)MEMORY[0x1E0C83780](a1);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1E0C837B8](*(_QWORD *)&a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C83818](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

kern_return_t host_check_multiuser_mode(host_t host, uint32_t *multiuser_mode)
{
  return MEMORY[0x1E0C83898](*(_QWORD *)&host, multiuser_mode);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1E0C83910](a1);
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x1E0C83950](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93D0](strm, version, *(_QWORD *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x1E0C839B8]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint64_t ne_tracker_check_is_hostname_blocked()
{
  return MEMORY[0x1E0C84318]();
}

uint64_t ne_tracker_copy_current_stacktrace()
{
  return MEMORY[0x1E0C84320]();
}

uint64_t ne_tracker_create_xcode_issue()
{
  return MEMORY[0x1E0C84328]();
}

uint64_t ne_tracker_should_save_stacktrace()
{
  return MEMORY[0x1E0C84338]();
}

uint64_t network_proxy_copy_host()
{
  return MEMORY[0x1E0CCEDB0]();
}

uint64_t network_proxy_create_from_parameters()
{
  return MEMORY[0x1E0CCEDB8]();
}

uint64_t network_proxy_get_port()
{
  return MEMORY[0x1E0CCEDC0]();
}

uint64_t network_proxy_get_type()
{
  return MEMORY[0x1E0CCEDC8]();
}

uint64_t network_proxy_is_transparent()
{
  return MEMORY[0x1E0CCEDD0]();
}

uint64_t nghttp2_check_header_name()
{
  return MEMORY[0x1E0DE3BE0]();
}

uint64_t nghttp2_check_header_value()
{
  return MEMORY[0x1E0DE3BE8]();
}

uint64_t nghttp2_option_del()
{
  return MEMORY[0x1E0DE3BF8]();
}

uint64_t nghttp2_option_new()
{
  return MEMORY[0x1E0DE3C00]();
}

uint64_t nghttp2_option_set_no_auto_window_update()
{
  return MEMORY[0x1E0DE3C08]();
}

uint64_t nghttp2_option_set_no_rfc9113_leading_and_trailing_ws_validation()
{
  return MEMORY[0x1E0DE3C28]();
}

uint64_t nghttp2_priority_spec_init()
{
  return MEMORY[0x1E0DE3C38]();
}

uint64_t nghttp2_session_callbacks_new()
{
  return MEMORY[0x1E0DE3C48]();
}

uint64_t nghttp2_session_callbacks_set_before_frame_send_callback()
{
  return MEMORY[0x1E0DE3C50]();
}

uint64_t nghttp2_session_callbacks_set_error_callback2()
{
  return MEMORY[0x1E0DE3C58]();
}

uint64_t nghttp2_session_callbacks_set_on_begin_headers_callback()
{
  return MEMORY[0x1E0DE3C60]();
}

uint64_t nghttp2_session_callbacks_set_on_data_chunk_recv_callback()
{
  return MEMORY[0x1E0DE3C68]();
}

uint64_t nghttp2_session_callbacks_set_on_frame_not_send_callback()
{
  return MEMORY[0x1E0DE3C70]();
}

uint64_t nghttp2_session_callbacks_set_on_frame_recv_callback()
{
  return MEMORY[0x1E0DE3C78]();
}

uint64_t nghttp2_session_callbacks_set_on_frame_send_callback()
{
  return MEMORY[0x1E0DE3C80]();
}

uint64_t nghttp2_session_callbacks_set_on_header_callback()
{
  return MEMORY[0x1E0DE3C88]();
}

uint64_t nghttp2_session_callbacks_set_on_invalid_frame_recv_callback()
{
  return MEMORY[0x1E0DE3C90]();
}

uint64_t nghttp2_session_callbacks_set_on_invalid_header_callback()
{
  return MEMORY[0x1E0DE3C98]();
}

uint64_t nghttp2_session_callbacks_set_on_stream_close_callback()
{
  return MEMORY[0x1E0DE3CA0]();
}

uint64_t nghttp2_session_client_new2()
{
  return MEMORY[0x1E0DE3CB8]();
}

uint64_t nghttp2_session_consume_connection()
{
  return MEMORY[0x1E0DE3CC0]();
}

uint64_t nghttp2_session_del()
{
  return MEMORY[0x1E0DE3CD0]();
}

uint64_t nghttp2_session_get_local_window_size()
{
  return MEMORY[0x1E0DE3CD8]();
}

uint64_t nghttp2_session_get_next_stream_id()
{
  return MEMORY[0x1E0DE3CE0]();
}

uint64_t nghttp2_session_get_stream_user_data()
{
  return MEMORY[0x1E0DE3CF8]();
}

uint64_t nghttp2_session_mem_recv()
{
  return MEMORY[0x1E0DE3D00]();
}

uint64_t nghttp2_session_mem_send()
{
  return MEMORY[0x1E0DE3D08]();
}

uint64_t nghttp2_session_resume_data()
{
  return MEMORY[0x1E0DE3D10]();
}

uint64_t nghttp2_session_set_next_stream_id()
{
  return MEMORY[0x1E0DE3D30]();
}

uint64_t nghttp2_session_set_stream_user_data()
{
  return MEMORY[0x1E0DE3D38]();
}

uint64_t nghttp2_session_terminate_session()
{
  return MEMORY[0x1E0DE3D40]();
}

uint64_t nghttp2_session_want_read()
{
  return MEMORY[0x1E0DE3D48]();
}

uint64_t nghttp2_session_want_write()
{
  return MEMORY[0x1E0DE3D50]();
}

uint64_t nghttp2_strerror()
{
  return MEMORY[0x1E0DE3D60]();
}

uint64_t nghttp2_submit_ping()
{
  return MEMORY[0x1E0DE3D80]();
}

uint64_t nghttp2_submit_priority()
{
  return MEMORY[0x1E0DE3D88]();
}

uint64_t nghttp2_submit_request()
{
  return MEMORY[0x1E0DE3D90]();
}

uint64_t nghttp2_submit_rst_stream()
{
  return MEMORY[0x1E0DE3D98]();
}

uint64_t nghttp2_submit_settings()
{
  return MEMORY[0x1E0DE3DA0]();
}

uint64_t nghttp2_submit_window_update()
{
  return MEMORY[0x1E0DE3DA8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1E0CCEDE0]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

uint64_t nw_activity_get_domain()
{
  return MEMORY[0x1E0CCEE18]();
}

uint64_t nw_activity_get_label()
{
  return MEMORY[0x1E0CCEE20]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x1E0CCEE28]();
}

uint64_t nw_activity_is_selected_for_reporting()
{
  return MEMORY[0x1E0CCEE48]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1E0CCEE50]();
}

uint64_t nw_activity_should_write_metric_stream_to_log()
{
  return MEMORY[0x1E0CCEE60]();
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x1E0CCEE78](name, type, domain);
}

uint64_t nw_authentication_challenge_copy_http_message()
{
  return MEMORY[0x1E0CCEEC8]();
}

uint64_t nw_authentication_challenge_copy_protection_space()
{
  return MEMORY[0x1E0CCEED0]();
}

uint64_t nw_authentication_challenge_get_attempt_count()
{
  return MEMORY[0x1E0CCEED8]();
}

uint64_t nw_authentication_credential_create()
{
  return MEMORY[0x1E0CCEEE0]();
}

uint64_t nw_authentication_credential_set_password()
{
  return MEMORY[0x1E0CCEEE8]();
}

uint64_t nw_authentication_credential_set_username()
{
  return MEMORY[0x1E0CCEEF0]();
}

uint64_t nw_authentication_protection_space_copy_endpoint()
{
  return MEMORY[0x1E0CCEEF8]();
}

uint64_t nw_connection_add_client_event()
{
  return MEMORY[0x1E0CCEF98]();
}

uint64_t nw_connection_append_and_start_application_protocol()
{
  return MEMORY[0x1E0CCEFA0]();
}

uint64_t nw_connection_better_path_available()
{
  return MEMORY[0x1E0CCEFB0]();
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

uint64_t nw_connection_copy_connected_local_endpoint()
{
  return MEMORY[0x1E0CCEFD0]();
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x1E0CCEFD8]();
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x1E0CCEFE0]();
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x1E0CCEFE8](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCEFF8](connection);
}

uint64_t nw_connection_copy_establishment_report_on_queue()
{
  return MEMORY[0x1E0CCF000]();
}

uint64_t nw_connection_copy_failed_resolution_report()
{
  return MEMORY[0x1E0CCF008]();
}

uint64_t nw_connection_copy_metadata()
{
  return MEMORY[0x1E0CCF010]();
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x1E0CCF020](connection, definition);
}

uint64_t nw_connection_copy_tcp_info()
{
  return MEMORY[0x1E0CCF028]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

nw_data_transfer_report_t nw_connection_create_new_data_transfer_report(nw_connection_t connection)
{
  return (nw_data_transfer_report_t)MEMORY[0x1E0CCF040](connection);
}

uint64_t nw_connection_decrement_estimated_bytes()
{
  return MEMORY[0x1E0CCF068]();
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x1E0CCF070]();
}

uint64_t nw_connection_failed_due_to_blocked_tracker()
{
  return MEMORY[0x1E0CCF078]();
}

uint64_t nw_connection_fillout_tcp_statistics()
{
  return MEMORY[0x1E0CCF080]();
}

void nw_connection_force_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCF088](connection);
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x1E0CCF098]();
}

uint64_t nw_connection_get_privacy_stance()
{
  return MEMORY[0x1E0CCF0A0]();
}

uint64_t nw_connection_get_uuid()
{
  return MEMORY[0x1E0CCF0A8]();
}

uint64_t nw_connection_increment_estimated_bytes()
{
  return MEMORY[0x1E0CCF0F0]();
}

uint64_t nw_connection_is_unlisted_tracker()
{
  return MEMORY[0x1E0CCF0F8]();
}

uint64_t nw_connection_modify_connected_protocol_stack()
{
  return MEMORY[0x1E0CCF100]();
}

uint64_t nw_connection_multipath_copy_subflow_counts()
{
  return MEMORY[0x1E0CCF108]();
}

uint64_t nw_connection_multipath_get_primary_subflow_interface_index()
{
  return MEMORY[0x1E0CCF110]();
}

uint64_t nw_connection_multipath_get_subflow_count()
{
  return MEMORY[0x1E0CCF118]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF128](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF130](connection, completion);
}

uint64_t nw_connection_receive_with_context()
{
  return MEMORY[0x1E0CCF140]();
}

uint64_t nw_connection_register_context()
{
  return MEMORY[0x1E0CCF148]();
}

uint64_t nw_connection_reset_expected_progress_target()
{
  return MEMORY[0x1E0CCF150]();
}

uint64_t nw_connection_reset_traffic_class()
{
  return MEMORY[0x1E0CCF158]();
}

void nw_connection_restart(nw_connection_t connection)
{
  MEMORY[0x1E0CCF160](connection);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

uint64_t nw_connection_set_adaptive_read_handler()
{
  return MEMORY[0x1E0CCF170]();
}

uint64_t nw_connection_set_adaptive_write_handler()
{
  return MEMORY[0x1E0CCF178]();
}

uint64_t nw_connection_set_alternate_path_state_handler()
{
  return MEMORY[0x1E0CCF180]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1E0CCF190]();
}

uint64_t nw_connection_set_excessive_keepalive_handler()
{
  return MEMORY[0x1E0CCF198]();
}

uint64_t nw_connection_set_low_throughput_handler()
{
  return MEMORY[0x1E0CCF1A0]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x1E0CCF1B8]();
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
  MEMORY[0x1E0CCF1C8](connection, handler);
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x1E0CCF1D0]();
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x1E0CCF1E0]();
}

uint64_t nw_connection_unregister_context()
{
  return MEMORY[0x1E0CCF1F0]();
}

uint64_t nw_connection_used_fallback()
{
  return MEMORY[0x1E0CCF1F8]();
}

uint64_t nw_connection_used_tfo()
{
  return MEMORY[0x1E0CCF200]();
}

uint64_t nw_connection_uses_multipath()
{
  return MEMORY[0x1E0CCF208]();
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x1E0CCF218](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x1E0CCF220](context_identifier);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return MEMORY[0x1E0CCF238](context);
}

uint64_t nw_content_context_get_is_wake_packet()
{
  return MEMORY[0x1E0CCF240]();
}

void nw_content_context_set_is_final(nw_content_context_t context, BOOL is_final)
{
  MEMORY[0x1E0CCF250](context, is_final);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
  MEMORY[0x1E0CCF258](context, protocol_metadata);
}

uint64_t nw_context_activate()
{
  return MEMORY[0x1E0CCF268]();
}

uint64_t nw_context_add_proxy()
{
  return MEMORY[0x1E0CCF270]();
}

uint64_t nw_context_copy_implicit_context()
{
  return MEMORY[0x1E0CCF280]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x1E0CCF290]();
}

uint64_t nw_context_get_identifier()
{
  return MEMORY[0x1E0CCF2A0]();
}

uint64_t nw_context_get_privacy_level()
{
  return MEMORY[0x1E0CCF2A8]();
}

uint64_t nw_context_set_isolate_protocol_cache()
{
  return MEMORY[0x1E0CCF2C0]();
}

uint64_t nw_context_set_privacy_level()
{
  return MEMORY[0x1E0CCF2D0]();
}

void nw_data_transfer_report_collect(nw_data_transfer_report_t report, dispatch_queue_t queue, nw_data_transfer_report_collect_block_t collect_block)
{
  MEMORY[0x1E0CCF2E0](report, queue, collect_block);
}

uint64_t nw_data_transfer_report_collect_on_nw_queue()
{
  return MEMORY[0x1E0CCF2E8]();
}

uint64_t nw_data_transfer_report_copy_dictionary()
{
  return MEMORY[0x1E0CCF2F0]();
}

uint64_t nw_data_transfer_report_create_from_dictionary()
{
  return MEMORY[0x1E0CCF300]();
}

uint64_t nw_endpoint_add_alternative()
{
  return MEMORY[0x1E0CCF338]();
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1E0CCF340](endpoint);
}

uint64_t nw_endpoint_copy_proxy_original_endpoint()
{
  return MEMORY[0x1E0CCF380]();
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x1E0CCF3B8]();
}

uint64_t nw_endpoint_enumerate_cnames()
{
  return MEMORY[0x1E0CCF3D0]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1E0CCF3D8](endpoint);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x1E0CCF400]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF410](endpoint);
}

uint64_t nw_endpoint_get_parent_endpoint_domain()
{
  return MEMORY[0x1E0CCF420]();
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF428](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF440](endpoint);
}

uint64_t nw_endpoint_set_alternate_port()
{
  return MEMORY[0x1E0CCF448]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1E0CCF468](error);
}

uint64_t nw_establishment_report_copy_dictionary()
{
  return MEMORY[0x1E0CCF478]();
}

nw_endpoint_t nw_establishment_report_copy_proxy_endpoint(nw_establishment_report_t report)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF480](report);
}

uint64_t nw_establishment_report_create_from_dictionary()
{
  return MEMORY[0x1E0CCF488]();
}

void nw_establishment_report_enumerate_protocols(nw_establishment_report_t report, nw_report_protocol_enumerator_t enumerate_block)
{
  MEMORY[0x1E0CCF490](report, enumerate_block);
}

uint64_t nw_establishment_report_enumerate_proxied_next_hop_endpoints()
{
  return MEMORY[0x1E0CCF498]();
}

void nw_establishment_report_enumerate_resolution_reports(nw_establishment_report_t report, nw_report_resolution_report_enumerator_t enumerate_block)
{
  MEMORY[0x1E0CCF4A0](report, enumerate_block);
}

uint64_t nw_establishment_report_get_attempt_started_after_milliseconds(nw_establishment_report_t report)
{
  return MEMORY[0x1E0CCF4B0](report);
}

uint64_t nw_establishment_report_get_duration_milliseconds(nw_establishment_report_t report)
{
  return MEMORY[0x1E0CCF4B8](report);
}

uint64_t nw_establishment_report_get_flow_started_after_milliseconds()
{
  return MEMORY[0x1E0CCF4C0]();
}

uint64_t nw_establishment_report_get_resolution_started_after_milliseconds()
{
  return MEMORY[0x1E0CCF4C8]();
}

BOOL nw_establishment_report_get_used_proxy(nw_establishment_report_t report)
{
  return MEMORY[0x1E0CCF4D0](report);
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x1E0CCF6F0]();
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1E0CCF6F8]();
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1E0CCF710](interface);
}

uint64_t nw_interface_get_subtype()
{
  return MEMORY[0x1E0CCF720]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x1E0CCF728](interface);
}

void nw_ip_options_set_local_address_preference(nw_protocol_options_t options, nw_ip_local_address_preference_t preference)
{
  MEMORY[0x1E0CCF7B0](options, *(_QWORD *)&preference);
}

void nw_listener_cancel(nw_listener_t listener)
{
  MEMORY[0x1E0CCF7C8](listener);
}

nw_listener_t nw_listener_create_with_port(const char *port, nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1E0CCF7E8](port, parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return MEMORY[0x1E0CCF7F0](listener);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
  MEMORY[0x1E0CCF7F8](listener, advertise_descriptor);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x1E0CCF810](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF820](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF828](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x1E0CCF830](listener);
}

uint64_t nw_parameters_add_protocol_stack_member()
{
  return MEMORY[0x1E0CCF898]();
}

uint64_t nw_parameters_add_proxy_options()
{
  return MEMORY[0x1E0CCF8A0]();
}

uint64_t nw_parameters_clear_proxy_options()
{
  return MEMORY[0x1E0CCF8B0]();
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF8B8](parameters);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

uint64_t nw_parameters_copy_preferred_netagent_domains()
{
  return MEMORY[0x1E0CCF8F8]();
}

uint64_t nw_parameters_copy_preferred_netagent_types()
{
  return MEMORY[0x1E0CCF900]();
}

uint64_t nw_parameters_copy_prohibited_interface_subtypes()
{
  return MEMORY[0x1E0CCF908]();
}

uint64_t nw_parameters_copy_prohibited_interface_types()
{
  return MEMORY[0x1E0CCF910]();
}

uint64_t nw_parameters_copy_protocol_value()
{
  return MEMORY[0x1E0CCF920]();
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

uint64_t nw_parameters_create_protocol_parameters()
{
  return MEMORY[0x1E0CCF958]();
}

uint64_t nw_parameters_create_quic_connection()
{
  return MEMORY[0x1E0CCF970]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF980](configure_tls, configure_tcp);
}

uint64_t nw_parameters_create_secure_tcp_or_quic_connection()
{
  return MEMORY[0x1E0CCF988]();
}

uint64_t nw_parameters_get_traffic_class()
{
  return MEMORY[0x1E0CCFA20]();
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
  MEMORY[0x1E0CCFA48](parameters, interface);
}

uint64_t nw_parameters_set_account_id()
{
  return MEMORY[0x1E0CCFA50]();
}

uint64_t nw_parameters_set_allow_ultra_constrained()
{
  return MEMORY[0x1E0CCFA60]();
}

uint64_t nw_parameters_set_attributed_bundle_identifier()
{
  return MEMORY[0x1E0CCFA68]();
}

void nw_parameters_set_attribution(nw_parameters_t parameters, nw_parameters_attribution_t attribution)
{
  MEMORY[0x1E0CCFA70](parameters, attribution);
}

uint64_t nw_parameters_set_block_trackers()
{
  return MEMORY[0x1E0CCFA80]();
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x1E0CCFA90]();
}

uint64_t nw_parameters_set_discretionary()
{
  return MEMORY[0x1E0CCFAB0]();
}

uint64_t nw_parameters_set_ecn_mode()
{
  return MEMORY[0x1E0CCFAC0]();
}

uint64_t nw_parameters_set_effective_bundle_id()
{
  return MEMORY[0x1E0CCFAD0]();
}

uint64_t nw_parameters_set_expected_workload()
{
  return MEMORY[0x1E0CCFAD8]();
}

void nw_parameters_set_expired_dns_behavior(nw_parameters_t parameters, nw_parameters_expired_dns_behavior_t expired_dns_behavior)
{
  MEMORY[0x1E0CCFAE0](parameters, *(_QWORD *)&expired_dns_behavior);
}

uint64_t nw_parameters_set_fail_if_svcb_received()
{
  return MEMORY[0x1E0CCFAE8]();
}

uint64_t nw_parameters_set_https_proxy_is_opaque()
{
  return MEMORY[0x1E0CCFAF0]();
}

uint64_t nw_parameters_set_https_proxy_over_tls()
{
  return MEMORY[0x1E0CCFAF8]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x1E0CCFB10]();
}

uint64_t nw_parameters_set_initial_data_payload()
{
  return MEMORY[0x1E0CCFB18]();
}

uint64_t nw_parameters_set_is_known_tracker()
{
  return MEMORY[0x1E0CCFB20]();
}

uint64_t nw_parameters_set_is_third_party_web_content()
{
  return MEMORY[0x1E0CCFB28]();
}

uint64_t nw_parameters_set_metadata()
{
  return MEMORY[0x1E0CCFB40]();
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
  MEMORY[0x1E0CCFB48](parameters, *(_QWORD *)&multipath_service);
}

uint64_t nw_parameters_set_no_fallback()
{
  return MEMORY[0x1E0CCFB58]();
}

uint64_t nw_parameters_set_no_proxy()
{
  return MEMORY[0x1E0CCFB60]();
}

void nw_parameters_set_prefer_no_proxy(nw_parameters_t parameters, BOOL prefer_no_proxy)
{
  MEMORY[0x1E0CCFB78](parameters, prefer_no_proxy);
}

uint64_t nw_parameters_set_preferred_netagent_classes()
{
  return MEMORY[0x1E0CCFB80]();
}

uint64_t nw_parameters_set_privacy_proxy_fail_closed()
{
  return MEMORY[0x1E0CCFB88]();
}

uint64_t nw_parameters_set_privacy_proxy_fail_closed_for_unreachable_hosts()
{
  return MEMORY[0x1E0CCFB90]();
}

void nw_parameters_set_prohibit_constrained(nw_parameters_t parameters, BOOL prohibit_constrained)
{
  MEMORY[0x1E0CCFB98](parameters, prohibit_constrained);
}

uint64_t nw_parameters_set_prohibit_encrypted_dns()
{
  return MEMORY[0x1E0CCFBA0]();
}

void nw_parameters_set_prohibit_expensive(nw_parameters_t parameters, BOOL prohibit_expensive)
{
  MEMORY[0x1E0CCFBA8](parameters, prohibit_expensive);
}

uint64_t nw_parameters_set_prohibit_privacy_proxy()
{
  return MEMORY[0x1E0CCFBB0]();
}

uint64_t nw_parameters_set_prohibited_interface_subtypes()
{
  return MEMORY[0x1E0CCFBB8]();
}

uint64_t nw_parameters_set_prohibited_interface_types()
{
  return MEMORY[0x1E0CCFBC0]();
}

uint64_t nw_parameters_set_protocol_value()
{
  return MEMORY[0x1E0CCFBD0]();
}

uint64_t nw_parameters_set_proxy_configuration()
{
  return MEMORY[0x1E0CCFBD8]();
}

uint64_t nw_parameters_set_receive_any_interface()
{
  return MEMORY[0x1E0CCFBE0]();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x1E0CCFC00]();
}

void nw_parameters_set_requires_dnssec_validation(nw_parameters_t parameters, BOOL requires_dnssec_validation)
{
  MEMORY[0x1E0CCFC08](parameters, requires_dnssec_validation);
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x1E0CCFC18](parameters, reuse_local_address);
}

uint64_t nw_parameters_set_skip_stack_trace_capture()
{
  return MEMORY[0x1E0CCFC30]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x1E0CCFC38]();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return MEMORY[0x1E0CCFC40]();
}

uint64_t nw_parameters_set_source_application_by_external_bundle_id()
{
  return MEMORY[0x1E0CCFC48]();
}

uint64_t nw_parameters_set_tracker_context()
{
  return MEMORY[0x1E0CCFC60]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x1E0CCFC68]();
}

uint64_t nw_parameters_set_url()
{
  return MEMORY[0x1E0CCFC78]();
}

uint64_t nw_parameters_set_use_awdl()
{
  return MEMORY[0x1E0CCFC80]();
}

uint64_t nw_parameters_set_use_enhanced_privacy_mode()
{
  return MEMORY[0x1E0CCFC88]();
}

uint64_t nw_parameters_set_use_p2p()
{
  return MEMORY[0x1E0CCFC90]();
}

uint64_t nw_parameters_set_web_search_content()
{
  return MEMORY[0x1E0CCFC98]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1E0CCFCD0]();
}

uint64_t nw_path_copy_parameters()
{
  return MEMORY[0x1E0CCFCE8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

uint64_t nw_path_get_interface_index()
{
  return MEMORY[0x1E0CCFD90]();
}

uint64_t nw_path_get_ipv4_network_signature()
{
  return MEMORY[0x1E0CCFD98]();
}

uint64_t nw_path_get_ipv6_network_signature()
{
  return MEMORY[0x1E0CCFDA0]();
}

uint64_t nw_path_get_policy_id()
{
  return MEMORY[0x1E0CCFDC8]();
}

uint64_t nw_path_get_reason()
{
  return MEMORY[0x1E0CCFDD0]();
}

uint64_t nw_path_get_vpn_config_id()
{
  return MEMORY[0x1E0CCFDF0]();
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x1E0CCFE10](path);
}

uint64_t nw_path_is_direct()
{
  return MEMORY[0x1E0CCFE18]();
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x1E0CCFE20](path);
}

uint64_t nw_path_is_local()
{
  return MEMORY[0x1E0CCFE30]();
}

uint64_t nw_path_is_per_app_vpn()
{
  return MEMORY[0x1E0CCFE38]();
}

uint64_t nw_path_uses_interface_subtype()
{
  return MEMORY[0x1E0CCFE80]();
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1E0CCFE88](path, *(_QWORD *)&interface_type);
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x1E0CCFEB0]();
}

nw_protocol_definition_t nw_protocol_copy_tcp_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCFED8]();
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCFEE0]();
}

nw_protocol_definition_t nw_protocol_copy_ws_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCFEE8]();
}

BOOL nw_protocol_definition_is_equal(nw_protocol_definition_t definition1, nw_protocol_definition_t definition2)
{
  return MEMORY[0x1E0CCFF08](definition1, definition2);
}

BOOL nw_protocol_metadata_is_tls(nw_protocol_metadata_t metadata)
{
  return MEMORY[0x1E0CCFF70](metadata);
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x1E0CCFF90]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x1E0CCFFB8]();
}

nw_protocol_options_t nw_protocol_stack_copy_internet_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CCFFD0](stack);
}

uint64_t nw_protocols_are_equal()
{
  return MEMORY[0x1E0CD0060]();
}

uint64_t nw_proxy_config_stack_requires_http_protocols()
{
  return MEMORY[0x1E0CD0098]();
}

uint64_t nw_proxy_copy_http_connect_definition()
{
  return MEMORY[0x1E0CD00A0]();
}

uint64_t nw_proxy_create_options()
{
  return MEMORY[0x1E0CD00B0]();
}

uint64_t nw_proxy_options_set_authentication_challenge_handler()
{
  return MEMORY[0x1E0CD00B8]();
}

uint64_t nw_proxy_options_set_http_proxy_authorization_header()
{
  return MEMORY[0x1E0CD00C0]();
}

uint64_t nw_queue_context_target_dispatch_queue()
{
  return MEMORY[0x1E0CD0110]();
}

uint64_t nw_quic_connection_close_with_error()
{
  return MEMORY[0x1E0CD0140]();
}

uint64_t nw_quic_connection_copy_sec_protocol_metadata()
{
  return MEMORY[0x1E0CD0148]();
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x1E0CD0150]();
}

uint64_t nw_quic_connection_copy_stream_metadata()
{
  return MEMORY[0x1E0CD0158]();
}

uint64_t nw_quic_connection_get_application_error()
{
  return MEMORY[0x1E0CD0160]();
}

uint64_t nw_quic_connection_get_peer_idle_timeout()
{
  return MEMORY[0x1E0CD0168]();
}

uint64_t nw_quic_connection_metadata_set_stream_options()
{
  return MEMORY[0x1E0CD0170]();
}

uint64_t nw_quic_connection_report_application_result()
{
  return MEMORY[0x1E0CD0178]();
}

uint64_t nw_quic_connection_set_enable_l4s()
{
  return MEMORY[0x1E0CD0188]();
}

uint64_t nw_quic_connection_set_idle_timeout()
{
  return MEMORY[0x1E0CD0198]();
}

uint64_t nw_quic_connection_set_initial_max_streams_bidirectional()
{
  return MEMORY[0x1E0CD01A0]();
}

uint64_t nw_quic_connection_set_initial_max_streams_unidirectional()
{
  return MEMORY[0x1E0CD01A8]();
}

uint64_t nw_quic_connection_set_keepalive()
{
  return MEMORY[0x1E0CD01B0]();
}

uint64_t nw_quic_connection_set_keepalive_count()
{
  return MEMORY[0x1E0CD01B8]();
}

uint64_t nw_quic_connection_set_max_streams_unidirectional()
{
  return MEMORY[0x1E0CD01C8]();
}

uint64_t nw_quic_connection_set_max_streams_update_block()
{
  return MEMORY[0x1E0CD01D0]();
}

uint64_t nw_quic_create_connection_metadata()
{
  return MEMORY[0x1E0CD01E8]();
}

uint64_t nw_quic_create_stream_options()
{
  return MEMORY[0x1E0CD01F8]();
}

uint64_t nw_quic_stream_get_application_error()
{
  return MEMORY[0x1E0CD0228]();
}

uint64_t nw_quic_stream_get_id()
{
  return MEMORY[0x1E0CD0230]();
}

uint64_t nw_quic_stream_set_application_error()
{
  return MEMORY[0x1E0CD0238]();
}

uint64_t nw_quic_stream_set_is_unidirectional()
{
  return MEMORY[0x1E0CD0240]();
}

void nw_release(void *obj)
{
  MEMORY[0x1E0CD0248](obj);
}

uint64_t nw_resolution_report_get_milliseconds(nw_resolution_report_t resolution_report)
{
  return MEMORY[0x1E0CD0278](resolution_report);
}

nw_report_resolution_protocol_t nw_resolution_report_get_protocol(nw_resolution_report_t resolution_report)
{
  return MEMORY[0x1E0CD0280](resolution_report);
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x1E0CD0318](obj);
}

uint64_t nw_settings_get_networkscore_sampling_rate_denominator()
{
  return MEMORY[0x1E0CD0330]();
}

uint64_t nw_settings_get_quic_enabled()
{
  return MEMORY[0x1E0CD0338]();
}

uint64_t nw_settings_get_signposts_enabled()
{
  return MEMORY[0x1E0CD0340]();
}

uint64_t nw_settings_networkscore_metrics_enabled()
{
  return MEMORY[0x1E0CD0350]();
}

void nw_tcp_options_set_connection_timeout(nw_protocol_options_t options, uint32_t connection_timeout)
{
  MEMORY[0x1E0CD0370](options, *(_QWORD *)&connection_timeout);
}

uint64_t nw_tcp_options_set_enable_background_traffic_management()
{
  return MEMORY[0x1E0CD0378]();
}

void nw_tcp_options_set_enable_fast_open(nw_protocol_options_t options, BOOL enable_fast_open)
{
  MEMORY[0x1E0CD0380](options, enable_fast_open);
}

uint64_t nw_tcp_options_set_enable_l4s()
{
  return MEMORY[0x1E0CD0390]();
}

void nw_tcp_options_set_no_delay(nw_protocol_options_t options, BOOL no_delay)
{
  MEMORY[0x1E0CD03A8](options, no_delay);
}

uint64_t nw_tcp_set_no_wake_from_sleep()
{
  return MEMORY[0x1E0CD03B8]();
}

sec_protocol_metadata_t nw_tls_copy_sec_protocol_metadata(nw_protocol_metadata_t metadata)
{
  return (sec_protocol_metadata_t)MEMORY[0x1E0CD03C0](metadata);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CD03D0]();
}

nw_protocol_metadata_t nw_ws_create_metadata(nw_ws_opcode_t opcode)
{
  return (nw_protocol_metadata_t)MEMORY[0x1E0CD0418](*(_QWORD *)&opcode);
}

nw_protocol_options_t nw_ws_create_options(nw_ws_version_t version)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CD0420](*(_QWORD *)&version);
}

nw_ws_close_code_t nw_ws_metadata_get_close_code(nw_protocol_metadata_t metadata)
{
  return MEMORY[0x1E0CD0430](metadata);
}

nw_ws_opcode_t nw_ws_metadata_get_opcode(nw_protocol_metadata_t metadata)
{
  return MEMORY[0x1E0CD0438](metadata);
}

void nw_ws_metadata_set_close_code(nw_protocol_metadata_t metadata, nw_ws_close_code_t close_code)
{
  MEMORY[0x1E0CD0440](metadata, *(_QWORD *)&close_code);
}

void nw_ws_metadata_set_pong_handler(nw_protocol_metadata_t metadata, dispatch_queue_t client_queue, nw_ws_pong_handler_t pong_handler)
{
  MEMORY[0x1E0CD0448](metadata, client_queue, pong_handler);
}

void nw_ws_options_add_subprotocol(nw_protocol_options_t options, const char *subprotocol)
{
  MEMORY[0x1E0CD0458](options, subprotocol);
}

void nw_ws_options_set_auto_reply_ping(nw_protocol_options_t options, BOOL auto_reply_ping)
{
  MEMORY[0x1E0CD0460](options, auto_reply_ping);
}

void nw_ws_options_set_maximum_message_size(nw_protocol_options_t options, size_t maximum_message_size)
{
  MEMORY[0x1E0CD0470](options, maximum_message_size);
}

uint64_t nw_ws_options_set_permessage_deflate()
{
  return MEMORY[0x1E0CD0478]();
}

uint64_t nw_ws_options_set_prepend_data()
{
  return MEMORY[0x1E0CD0480]();
}

void nw_ws_options_set_skip_handshake(nw_protocol_options_t options, BOOL skip_handshake)
{
  MEMORY[0x1E0CD0488](options, skip_handshake);
}

uint64_t nw_ws_validate_server_response_with_protocol_options()
{
  return MEMORY[0x1E0CD04B0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1E0C85068](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

SecCertificateRef sec_certificate_copy_ref(sec_certificate_t certificate)
{
  return (SecCertificateRef)MEMORY[0x1E0CD7120](certificate);
}

SecIdentityRef sec_identity_copy_ref(sec_identity_t identity)
{
  return (SecIdentityRef)MEMORY[0x1E0CD7140](identity);
}

sec_identity_t sec_identity_create_with_certificates(SecIdentityRef identity, CFArrayRef certificates)
{
  return (sec_identity_t)MEMORY[0x1E0CD7150](identity, certificates);
}

BOOL sec_protocol_metadata_access_distinguished_names(sec_protocol_metadata_t metadata, void *handler)
{
  return MEMORY[0x1E0CD7180](metadata, handler);
}

BOOL sec_protocol_metadata_access_peer_certificate_chain(sec_protocol_metadata_t metadata, void *handler)
{
  return MEMORY[0x1E0CD7188](metadata, handler);
}

uint64_t sec_protocol_metadata_access_sent_certificates()
{
  return MEMORY[0x1E0CD7190]();
}

BOOL sec_protocol_metadata_challenge_parameters_are_equal(sec_protocol_metadata_t metadataA, sec_protocol_metadata_t metadataB)
{
  return MEMORY[0x1E0CD7198](metadataA, metadataB);
}

uint64_t sec_protocol_metadata_copy_sec_identity()
{
  return MEMORY[0x1E0CD71B8]();
}

uint64_t sec_protocol_metadata_copy_sec_trust()
{
  return MEMORY[0x1E0CD71C0]();
}

SSLCipherSuite sec_protocol_metadata_get_negotiated_ciphersuite(sec_protocol_metadata_t metadata)
{
  return MEMORY[0x1E0CD71D0](metadata);
}

const char *__cdecl sec_protocol_metadata_get_negotiated_protocol(sec_protocol_metadata_t metadata)
{
  return (const char *)MEMORY[0x1E0CD71D8](metadata);
}

SSLProtocol sec_protocol_metadata_get_negotiated_protocol_version(sec_protocol_metadata_t metadata)
{
  return MEMORY[0x1E0CD71E0](metadata);
}

tls_ciphersuite_t sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x1E0CD71E8](metadata);
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x1E0CD71F0](metadata);
}

BOOL sec_protocol_metadata_peers_are_equal(sec_protocol_metadata_t metadataA, sec_protocol_metadata_t metadataB)
{
  return MEMORY[0x1E0CD7200](metadataA, metadataB);
}

void sec_protocol_options_add_pre_shared_key(sec_protocol_options_t options, dispatch_data_t psk, dispatch_data_t psk_identity)
{
  MEMORY[0x1E0CD7210](options, psk, psk_identity);
}

void sec_protocol_options_add_tls_ciphersuite(sec_protocol_options_t options, SSLCipherSuite ciphersuite)
{
  MEMORY[0x1E0CD7220](options, ciphersuite);
}

void sec_protocol_options_add_tls_ciphersuite_group(sec_protocol_options_t options, SSLCiphersuiteGroup group)
{
  MEMORY[0x1E0CD7228](options, *(_QWORD *)&group);
}

uint64_t sec_protocol_options_add_transport_specific_application_protocol()
{
  return MEMORY[0x1E0CD7238]();
}

tls_protocol_version_t sec_protocol_options_get_default_max_tls_protocol_version(void)
{
  return (unsigned __int16)MEMORY[0x1E0CD7270]();
}

tls_protocol_version_t sec_protocol_options_get_default_min_tls_protocol_version(void)
{
  return (unsigned __int16)MEMORY[0x1E0CD7278]();
}

void sec_protocol_options_set_challenge_block(sec_protocol_options_t options, sec_protocol_challenge_t challenge_block, dispatch_queue_t challenge_queue)
{
  MEMORY[0x1E0CD7298](options, challenge_block, challenge_queue);
}

void sec_protocol_options_set_enable_encrypted_client_hello(sec_protocol_options_t options, BOOL enable_encrypted_client_hello)
{
  MEMORY[0x1E0CD72A8](options, enable_encrypted_client_hello);
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x1E0CD72B8](options, identity);
}

void sec_protocol_options_set_peer_authentication_optional(sec_protocol_options_t options, BOOL peer_authentication_optional)
{
  MEMORY[0x1E0CD72E0](options, peer_authentication_optional);
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
  MEMORY[0x1E0CD72E8](options, peer_authentication_required);
}

void sec_protocol_options_set_tls_diffie_hellman_parameters(sec_protocol_options_t options, dispatch_data_t params)
{
  MEMORY[0x1E0CD7300](options, params);
}

void sec_protocol_options_set_tls_false_start_enabled(sec_protocol_options_t options, BOOL false_start_enabled)
{
  MEMORY[0x1E0CD7310](options, false_start_enabled);
}

void sec_protocol_options_set_tls_is_fallback_attempt(sec_protocol_options_t options, BOOL is_fallback_attempt)
{
  MEMORY[0x1E0CD7318](options, is_fallback_attempt);
}

void sec_protocol_options_set_tls_max_version(sec_protocol_options_t options, SSLProtocol version)
{
  MEMORY[0x1E0CD7320](options, *(_QWORD *)&version);
}

void sec_protocol_options_set_tls_min_version(sec_protocol_options_t options, SSLProtocol version)
{
  MEMORY[0x1E0CD7328](options, *(_QWORD *)&version);
}

void sec_protocol_options_set_tls_resumption_enabled(sec_protocol_options_t options, BOOL resumption_enabled)
{
  MEMORY[0x1E0CD7330](options, resumption_enabled);
}

void sec_protocol_options_set_tls_server_name(sec_protocol_options_t options, const char *server_name)
{
  MEMORY[0x1E0CD7338](options, server_name);
}

uint64_t sec_protocol_options_set_tls_sni_disabled()
{
  return MEMORY[0x1E0CD7340]();
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
  MEMORY[0x1E0CD7348](options, tickets_enabled);
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x1E0CD7350](options, verify_block, verify_block_queue);
}

void sec_release(void *obj)
{
  MEMORY[0x1E0CD7358](obj);
}

void *__cdecl sec_retain(void *obj)
{
  return (void *)MEMORY[0x1E0CD7360](obj);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1E0CD7368](trust);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1E0C85280](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1E0C85310](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1E0C85380](*(_QWORD *)&a1, a2);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1E0DE8738](a1, *(_QWORD *)&op);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1E0DE8848](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8878](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncasecmp_l(const char *a1, const char *a2, size_t a3, locale_t a4)
{
  return MEMORY[0x1E0C85598](a1, a2, a3, a4);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856C0](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x1E0C857B8](*(_QWORD *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x1E0C857C8]();
}

uint64_t tcp_connection_accept()
{
  return MEMORY[0x1E0CD04B8]();
}

uint64_t tcp_connection_add_event_adaptive_read_timeout()
{
  return MEMORY[0x1E0CD04C0]();
}

uint64_t tcp_connection_add_event_adaptive_write_timeout()
{
  return MEMORY[0x1E0CD04C8]();
}

uint64_t tcp_connection_add_event_excessive_keepalives()
{
  return MEMORY[0x1E0CD04D0]();
}

uint64_t tcp_connection_allow_client_socket_access()
{
  return MEMORY[0x1E0CD04D8]();
}

uint64_t tcp_connection_cancel()
{
  return MEMORY[0x1E0CD04E0]();
}

uint64_t tcp_connection_conditions_get_unmet_reason()
{
  return MEMORY[0x1E0CD04E8]();
}

uint64_t tcp_connection_conditions_met()
{
  return MEMORY[0x1E0CD04F0]();
}

uint64_t tcp_connection_copy_endpoint()
{
  return MEMORY[0x1E0CD04F8]();
}

uint64_t tcp_connection_copy_parameters()
{
  return MEMORY[0x1E0CD0500]();
}

uint64_t tcp_connection_copy_proxy()
{
  return MEMORY[0x1E0CD0508]();
}

uint64_t tcp_connection_copy_socket()
{
  return MEMORY[0x1E0CD0510]();
}

uint64_t tcp_connection_copy_tcp_info()
{
  return MEMORY[0x1E0CD0518]();
}

uint64_t tcp_connection_create()
{
  return MEMORY[0x1E0CD0520]();
}

uint64_t tcp_connection_create_with_connected_fd()
{
  return MEMORY[0x1E0CD0528]();
}

uint64_t tcp_connection_create_with_service()
{
  return MEMORY[0x1E0CD0530]();
}

uint64_t tcp_connection_create_with_sockaddr()
{
  return MEMORY[0x1E0CD0538]();
}

uint64_t tcp_connection_did_fallback()
{
  return MEMORY[0x1E0CD0540]();
}

uint64_t tcp_connection_get_connection_quality()
{
  return MEMORY[0x1E0CD0558]();
}

uint64_t tcp_connection_get_error()
{
  return MEMORY[0x1E0CD0560]();
}

uint64_t tcp_connection_get_hostname()
{
  return MEMORY[0x1E0CD0568]();
}

uint64_t tcp_connection_get_local()
{
  return MEMORY[0x1E0CD0570]();
}

uint64_t tcp_connection_get_remote()
{
  return MEMORY[0x1E0CD0578]();
}

uint64_t tcp_connection_get_socket()
{
  return MEMORY[0x1E0CD0580]();
}

uint64_t tcp_connection_get_statistics()
{
  return MEMORY[0x1E0CD0588]();
}

uint64_t tcp_connection_has_better_route()
{
  return MEMORY[0x1E0CD0590]();
}

uint64_t tcp_connection_id()
{
  return MEMORY[0x1E0CD0598]();
}

uint64_t tcp_connection_is_cellular()
{
  return MEMORY[0x1E0CD05A0]();
}

uint64_t tcp_connection_is_expensive()
{
  return MEMORY[0x1E0CD05A8]();
}

uint64_t tcp_connection_is_multipath()
{
  return MEMORY[0x1E0CD05B0]();
}

uint64_t tcp_connection_is_viable()
{
  return MEMORY[0x1E0CD05B8]();
}

uint64_t tcp_connection_log_event()
{
  return MEMORY[0x1E0CD05C0]();
}

uint64_t tcp_connection_multipath_copy_subflow_switch_counts()
{
  return MEMORY[0x1E0CD05C8]();
}

uint64_t tcp_connection_multipath_get_primary_subflow_ifindex()
{
  return MEMORY[0x1E0CD05D0]();
}

uint64_t tcp_connection_multipath_get_subflow_count()
{
  return MEMORY[0x1E0CD05D8]();
}

uint64_t tcp_connection_override_obscure()
{
  return MEMORY[0x1E0CD05E0]();
}

uint64_t tcp_connection_read()
{
  return MEMORY[0x1E0CD05E8]();
}

uint64_t tcp_connection_release()
{
  return MEMORY[0x1E0CD05F0]();
}

uint64_t tcp_connection_retain()
{
  return MEMORY[0x1E0CD05F8]();
}

uint64_t tcp_connection_retry()
{
  return MEMORY[0x1E0CD0600]();
}

uint64_t tcp_connection_set_account_identifier()
{
  return MEMORY[0x1E0CD0608]();
}

uint64_t tcp_connection_set_cancel_handler()
{
  return MEMORY[0x1E0CD0610]();
}

uint64_t tcp_connection_set_cellular_service()
{
  return MEMORY[0x1E0CD0618]();
}

uint64_t tcp_connection_set_connection_attempt_timeout()
{
  return MEMORY[0x1E0CD0620]();
}

uint64_t tcp_connection_set_connection_pool()
{
  return MEMORY[0x1E0CD0628]();
}

uint64_t tcp_connection_set_ecn_enabled()
{
  return MEMORY[0x1E0CD0630]();
}

uint64_t tcp_connection_set_event_handler()
{
  return MEMORY[0x1E0CD0638]();
}

uint64_t tcp_connection_set_extended_background_idle()
{
  return MEMORY[0x1E0CD0640]();
}

uint64_t tcp_connection_set_fallback_fast()
{
  return MEMORY[0x1E0CD0648]();
}

uint64_t tcp_connection_set_indefinite()
{
  return MEMORY[0x1E0CD0650]();
}

uint64_t tcp_connection_set_interface_by_name()
{
  return MEMORY[0x1E0CD0658]();
}

uint64_t tcp_connection_set_keepalive()
{
  return MEMORY[0x1E0CD0660]();
}

uint64_t tcp_connection_set_keepalive_offload()
{
  return MEMORY[0x1E0CD0668]();
}

uint64_t tcp_connection_set_minimum_throughput()
{
  return MEMORY[0x1E0CD0670]();
}

uint64_t tcp_connection_set_no_cellular()
{
  return MEMORY[0x1E0CD0678]();
}

uint64_t tcp_connection_set_no_expensive()
{
  return MEMORY[0x1E0CD0680]();
}

uint64_t tcp_connection_set_no_fallback()
{
  return MEMORY[0x1E0CD0688]();
}

uint64_t tcp_connection_set_opportunistic()
{
  return MEMORY[0x1E0CD0690]();
}

uint64_t tcp_connection_set_persistent()
{
  return MEMORY[0x1E0CD0698]();
}

uint64_t tcp_connection_set_proxies()
{
  return MEMORY[0x1E0CD06A0]();
}

uint64_t tcp_connection_set_receive_any_interface()
{
  return MEMORY[0x1E0CD06A8]();
}

uint64_t tcp_connection_set_source_application()
{
  return MEMORY[0x1E0CD06B0]();
}

uint64_t tcp_connection_set_source_application_by_bundle()
{
  return MEMORY[0x1E0CD06B8]();
}

uint64_t tcp_connection_set_traffic_class()
{
  return MEMORY[0x1E0CD06C0]();
}

uint64_t tcp_connection_set_url()
{
  return MEMORY[0x1E0CD06C8]();
}

uint64_t tcp_connection_set_usage_model()
{
  return MEMORY[0x1E0CD06D0]();
}

uint64_t tcp_connection_start()
{
  return MEMORY[0x1E0CD06D8]();
}

uint64_t tcp_connection_write()
{
  return MEMORY[0x1E0CD06E0]();
}

uint64_t tcp_listener_cancel()
{
  return MEMORY[0x1E0CD06F0]();
}

uint64_t tcp_listener_create()
{
  return MEMORY[0x1E0CD06F8]();
}

uint64_t tcp_listener_enable_coprocessor_interface()
{
  return MEMORY[0x1E0CD0700]();
}

uint64_t tcp_listener_get_port()
{
  return MEMORY[0x1E0CD0708]();
}

uint64_t tcp_listener_release()
{
  return MEMORY[0x1E0CD0710]();
}

uint64_t tcp_listener_retain()
{
  return MEMORY[0x1E0CD0718]();
}

uint64_t tcp_listener_set_accept_handler()
{
  return MEMORY[0x1E0CD0720]();
}

uint64_t tcp_listener_set_accept_handler_f()
{
  return MEMORY[0x1E0CD0728]();
}

uint64_t tcp_listener_set_error_handler()
{
  return MEMORY[0x1E0CD0730]();
}

uint64_t tcp_listener_set_error_handler_f()
{
  return MEMORY[0x1E0CD0738]();
}

uint64_t tcp_listener_set_interface()
{
  return MEMORY[0x1E0CD0740]();
}

uint64_t tcp_listener_set_port()
{
  return MEMORY[0x1E0CD0748]();
}

uint64_t tcp_listener_set_service()
{
  return MEMORY[0x1E0CD0750]();
}

uint64_t tcp_listener_start()
{
  return MEMORY[0x1E0CD0758]();
}

int32_t uidna_nameToASCII(const UIDNA *idna, const UChar *name, int32_t length, UChar *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE62C0](idna, name, *(_QWORD *)&length, dest, *(_QWORD *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1E0DE62E0](*(_QWORD *)&options, pErrorCode);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t xpc_activity_should_be_data_budgeted()
{
  return MEMORY[0x1E0C85DC0]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

uint64_t GSSCreateCredentialFromUUID_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3C98]();
}

uint64_t gss_import_name_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3D10]();
}

uint64_t gss_aapl_initial_cred_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3CB0]();
}

uint64_t gss_release_name_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3D60]();
}

uint64_t gss_init_sec_context_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3D20]();
}

uint64_t gss_acquire_cred_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3CC0]();
}

uint64_t gss_release_buffer_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3D40]();
}

uint64_t gss_delete_sec_context_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3CE0]();
}

uint64_t gss_release_cred_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3D48]();
}

uint64_t gss_destroy_cred_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3CF0]();
}

uint64_t MKBUserTypeDeviceMode_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    dlopenHelper_MobileKeyBag(a1);
  return MEMORY[0x1E0D4E580]();
}

uint64_t AnalyticsIsEventUsed_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreAnalytics))
    dlopenHelper_CoreAnalytics(a1);
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreAnalytics))
    dlopenHelper_CoreAnalytics(a1);
  return MEMORY[0x1E0D15420]();
}

uint64_t appSSO_handleResponse_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AppSSOCore))
    dlopenHelper_AppSSOCore(a1);
  return MEMORY[0x1E0CF96F8]();
}

uint64_t MKBDeviceUnlockedSinceBoot_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    dlopenHelper_MobileKeyBag(a1);
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t _CTServerConnectionCreate_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreTelephony))
    dlopenHelper_CoreTelephony(a1);
  return MEMORY[0x1E0CA6F10]();
}

uint64_t _CTServerConnectionCopyPacketContextInterfaceName_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreTelephony))
    dlopenHelper_CoreTelephony(a1);
  return MEMORY[0x1E0CA6EE0]();
}

uint64_t AnalyticsSendEventLazy_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreAnalytics))
    dlopenHelper_CoreAnalytics(a1);
  return MEMORY[0x1E0D15428]();
}

uint64_t CGSizeCreateDictionaryRepresentation_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreGraphics))
    dlopenHelper_CoreGraphics(a1);
  return MEMORY[0x1E0C9D800]();
}

uint64_t _CTServerConnectionCarrierSettingsCopyValue_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreTelephony))
    dlopenHelper_CoreTelephony(a1);
  return MEMORY[0x1E0CA6E60]();
}

uint64_t entr_act_end_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libenergytrace_dylib))
    dlopenHelper_libenergytrace_dylib(a1);
  return MEMORY[0x1E0DE57F8]();
}

uint64_t spd_client_checkout_socket_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsp_dylib))
    dlopenHelper_libsp_dylib(a1);
  return MEMORY[0x1E0DE84B0]();
}

uint64_t spd_client_destroy_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsp_dylib))
    dlopenHelper_libsp_dylib(a1);
  return MEMORY[0x1E0DE84C0]();
}

uint64_t entr_act_modify_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libenergytrace_dylib))
    dlopenHelper_libenergytrace_dylib(a1);
  return MEMORY[0x1E0DE5800]();
}

uint64_t spd_client_create_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsp_dylib))
    dlopenHelper_libsp_dylib(a1);
  return MEMORY[0x1E0DE84B8]();
}

uint64_t spd_client_checkin_socket_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsp_dylib))
    dlopenHelper_libsp_dylib(a1);
  return MEMORY[0x1E0DE84A8]();
}

uint64_t entr_shouldtrace_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libenergytrace_dylib))
    dlopenHelper_libenergytrace_dylib(a1);
  return MEMORY[0x1E0DE5810]();
}

uint64_t entr_act_begin_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libenergytrace_dylib))
    dlopenHelper_libenergytrace_dylib(a1);
  return MEMORY[0x1E0DE57F0]();
}

uint64_t AOSAccountCreate_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    dlopenHelper_AOSKit(a1);
  return MEMORY[0x1E0CF1820]();
}

uint64_t _AOSAccountResolveAuthFailure_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    dlopenHelper_AOSKit(a1);
  return MEMORY[0x1E0CF1838]();
}

uint64_t AOSTransactionSuccessful_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    dlopenHelper_AOSKit(a1);
  return MEMORY[0x1E0CF1830]();
}

uint64_t AOSTransactionGetError_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    dlopenHelper_AOSKit(a1);
  return MEMORY[0x1E0CF1828]();
}

uint64_t AOSAccountCopyAuthInfo_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    dlopenHelper_AOSKit(a1);
  return MEMORY[0x1E0CF1818]();
}

uint64_t HeimCredSetImpersonateBundle_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Heimdal))
    dlopenHelper_Heimdal(a1);
  return MEMORY[0x1E0D2FC50]();
}

uint64_t symptom_new_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomReporter))
    dlopenHelper_SymptomReporter(a1);
  return MEMORY[0x1E0DB0140]();
}

uint64_t symptom_set_qualifier_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomReporter))
    dlopenHelper_SymptomReporter(a1);
  return MEMORY[0x1E0DB0180]();
}

uint64_t symptom_set_additional_qualifier_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomReporter))
    dlopenHelper_SymptomReporter(a1);
  return MEMORY[0x1E0DB0170]();
}

uint64_t symptom_send_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomReporter))
    dlopenHelper_SymptomReporter(a1);
  return MEMORY[0x1E0DB0158]();
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppSupport))
    dlopenHelper_AppSupport(a1);
  return MEMORY[0x1E0CFA230]();
}

uint64_t appSSO_willHandle_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AppSSOCore))
    dlopenHelper_AppSSOCore(a1);
  return MEMORY[0x1E0CF9708]();
}

uint64_t appSSO_handleResponseImpersonationCredential_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AppSSOCore))
    dlopenHelper_AppSSOCore(a1);
  return MEMORY[0x1E0CF9700]();
}

uint64_t MKBDeviceFormattedForContentProtection_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    dlopenHelper_MobileKeyBag(a1);
  return MEMORY[0x1E0D4E478]();
}

uint64_t CPCopyBundleIdentifierAndTeamFromSecTaskRef_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppSupport))
    dlopenHelper_AppSupport(a1);
  return MEMORY[0x1E0CFA240]();
}

uint64_t symptom_set_additional_digest_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomReporter))
    dlopenHelper_SymptomReporter(a1);
  return MEMORY[0x1E0DB0168]();
}

uint64_t symptom_framework_init_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomReporter))
    dlopenHelper_SymptomReporter(a1);
  return MEMORY[0x1E0DB0130]();
}

uint64_t gss_iter_creds_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    dlopenHelper_GSS(a1);
  return MEMORY[0x1E0CB3D30]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libenergytrace_dylib(double a1)
{
  dlopen("/usr/lib/libenergytrace.dylib", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_libenergytrace_dylib);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreTelephony(double a1)
{
  dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreTelephony);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppSupport(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_AppSupport);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libsp_dylib(double a1)
{
  dlopen("/usr/lib/libsp.dylib", 0);
  atomic_store(1u, &dlopenHelperFlag_libsp_dylib);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_DuetActivityScheduler(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/DuetActivityScheduler.framework/DuetActivityScheduler", 0);
  atomic_store(1u, &dlopenHelperFlag_DuetActivityScheduler);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SymptomReporter(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/SymptomReporter.framework/SymptomReporter", 0);
  atomic_store(1u, &dlopenHelperFlag_SymptomReporter);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AppSSOCore(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/AppSSOCore.framework/AppSSOCore", 0);
  atomic_store(1u, &dlopenHelperFlag_AppSSOCore);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Heimdal(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/Heimdal.framework/Heimdal", 0);
  atomic_store(1u, &dlopenHelperFlag_Heimdal);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_NetworkServiceProxy(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/NetworkServiceProxy.framework/NetworkServiceProxy", 0);
  atomic_store(1u, &dlopenHelperFlag_NetworkServiceProxy);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_FTServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/FTServices.framework/FTServices", 0);
  atomic_store(1u, &dlopenHelperFlag_FTServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AOSKit(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/AOSKit.framework/AOSKit", 0);
  atomic_store(1u, &dlopenHelperFlag_AOSKit);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_StreamingExtractor(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/StreamingExtractor.framework/StreamingExtractor", 0);
  atomic_store(1u, &dlopenHelperFlag_StreamingExtractor);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreAnalytics(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreAnalytics);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AVFoundation(double a1)
{
  dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_AVFoundation);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_StreamingZip(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/StreamingZip.framework/StreamingZip", 0);
  atomic_store(1u, &dlopenHelperFlag_StreamingZip);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_RunningBoardServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/RunningBoardServices.framework/RunningBoardServices", 0);
  atomic_store(1u, &dlopenHelperFlag_RunningBoardServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_InternationalSupport(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/InternationalSupport.framework/InternationalSupport", 0);
  atomic_store(1u, &dlopenHelperFlag_InternationalSupport);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_MobileKeyBag(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 0);
  atomic_store(1u, &dlopenHelperFlag_MobileKeyBag);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreGraphics(double a1)
{
  dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreGraphics);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GSS(double a1)
{
  dlopen("/System/Library/Frameworks/GSS.framework/GSS", 0);
  atomic_store(1u, &dlopenHelperFlag_GSS);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Accounts(double a1)
{
  dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 0);
  atomic_store(1u, &dlopenHelperFlag_Accounts);
  return a1;
}

void gotLoadHelper_x20__OBJC_CLASS___SZExtractor(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_StreamingZip))
    dlopenHelper_StreamingZip(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___STRemoteExtractor(double result)
{
  if (!atomic_load(&dlopenHelperFlag_StreamingExtractor))
    return dlopenHelper_StreamingExtractor(result);
  return result;
}

double gotLoadHelper_x8__GSSCreateCredentialFromUUID(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GSS))
    return dlopenHelper_GSS(result);
  return result;
}

double gotLoadHelper_x8__kMKBDeviceModeKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    return dlopenHelper_MobileKeyBag(result);
  return result;
}

double gotLoadHelper_x8__kMKBUserTypeKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    return dlopenHelper_MobileKeyBag(result);
  return result;
}

double gotLoadHelper_x8__kMKBDeviceModeMultiUser(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    return dlopenHelper_MobileKeyBag(result);
  return result;
}

double gotLoadHelper_x8__kMKBUserTypeEphemeral(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    return dlopenHelper_MobileKeyBag(result);
  return result;
}

double gotLoadHelper_x8__InternationalSupportVersionNumber(double result)
{
  if (!atomic_load(&dlopenHelperFlag_InternationalSupport))
    return dlopenHelper_InternationalSupport(result);
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___RBSAssertion(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    dlopenHelper_RunningBoardServices(a1);
}

void gotLoadHelper_x23__RBSAssertionErrorDomain(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    dlopenHelper_RunningBoardServices(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___RBSProcessHandle(double result)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    return dlopenHelper_RunningBoardServices(result);
  return result;
}

double gotLoadHelper_x8__RBSProcessTimeLimitationNone(double result)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    return dlopenHelper_RunningBoardServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___RBSDomainAttribute(double result)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    return dlopenHelper_RunningBoardServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___RBSAcquisitionCompletionAttribute(double result)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    return dlopenHelper_RunningBoardServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___RBSTarget(double result)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    return dlopenHelper_RunningBoardServices(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___RBSAssertion(double result)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    return dlopenHelper_RunningBoardServices(result);
  return result;
}

double gotLoadHelper_x8__SOErrorDomain(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AppSSOCore))
    return dlopenHelper_AppSSOCore(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NSPPrivateAccessTokenFetcher(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NetworkServiceProxy))
    return dlopenHelper_NetworkServiceProxy(result);
  return result;
}

double gotLoadHelper_x9__SOErrorDomain(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AppSSOCore))
    return dlopenHelper_AppSSOCore(result);
  return result;
}

double gotLoadHelper_x8___CTServerConnectionCreate(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreTelephony))
    return dlopenHelper_CoreTelephony(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____DASActivity(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS____DASScheduler(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadSession(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AVFoundation))
    return dlopenHelper_AVFoundation(result);
  return result;
}

void gotLoadHelper_x19__OBJC_CLASS___AVAssetDownloadSession(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AVFoundation))
    dlopenHelper_AVFoundation(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___AVAssetDownloadConfiguration(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AVFoundation))
    return dlopenHelper_AVFoundation(result);
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___STRemoteExtractor(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_StreamingExtractor))
    dlopenHelper_StreamingExtractor(a1);
}

void gotLoadHelper_x19__OBJC_CLASS___RBSProcessHandle(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_RunningBoardServices))
    dlopenHelper_RunningBoardServices(a1);
}

double gotLoadHelper_x8__spd_client_create(double result)
{
  if (!atomic_load(&dlopenHelperFlag_libsp_dylib))
    return dlopenHelper_libsp_dylib(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___AVURLAsset(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AVFoundation))
    return dlopenHelper_AVFoundation(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___AVMediaSelection(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AVFoundation))
    return dlopenHelper_AVFoundation(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___AVAggregateAssetDownloadTask(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AVFoundation))
    return dlopenHelper_AVFoundation(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___FTURLRequestMessage(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FTServices))
    return dlopenHelper_FTServices(result);
  return result;
}

double gotLoadHelper_x8__kAOSAuthTrustInfoKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    return dlopenHelper_AOSKit(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NSPPrivateAccessTokenChallenge(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NetworkServiceProxy))
    return dlopenHelper_NetworkServiceProxy(result);
  return result;
}

void gotLoadHelper_x27__kAOSMMeAuthTokenKey(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    dlopenHelper_AOSKit(a1);
}

double gotLoadHelper_x8__kAOSPersonIDKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AOSKit))
    return dlopenHelper_AOSKit(result);
  return result;
}

double gotLoadHelper_x8___DASSchedulingPriorityUserInitiated(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASActivityDurationShort(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASSchedulingPriorityUtility(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASSchedulingPriorityUserInitiatedOvercommit(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

void gotLoadHelper_x22___DASActivityTransferSizeSmall(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    dlopenHelper_DuetActivityScheduler(a1);
}

void gotLoadHelper_x23___DASActivityTransferSizeVerySmall(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    dlopenHelper_DuetActivityScheduler(a1);
}

double gotLoadHelper_x8___DASActivityTransferSizeGigantic(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x10___DASActivityTransferSizeVeryLarge(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x12___DASActivityTransferSizeLarge(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x14___DASActivityTransferSizeModerate(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASActivityTransferSizeVeryLarge(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASActivityTransferSizeLarge(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASActivityTransferSizeModerate(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8__kNWEndpointKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8__kNWParametersKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASSchedulingPriorityMaintenance(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASSchedulingPriorityBackground(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8___DASUpdateActivityCellTransferKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x9___DASUpdateActivityWifiTransferKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x9___DASUpdateActivityExpensiveTransferKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x10___DASUpdateActivityInexpensiveTransferKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x10___DASUpdateActivityUploadedBytesKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x11___DASUpdateActivityDownloadedBytesKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DuetActivityScheduler))
    return dlopenHelper_DuetActivityScheduler(result);
  return result;
}

double gotLoadHelper_x8__HeimCredSetImpersonateBundle(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Heimdal))
    return dlopenHelper_Heimdal(result);
  return result;
}

double gotLoadHelper_x8__symptom_framework_init(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomReporter))
    return dlopenHelper_SymptomReporter(result);
  return result;
}

double gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromAuditToken(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppSupport))
    return dlopenHelper_AppSupport(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___FTMessageDelivery_DualMode(double result)
{
  if (!atomic_load(&dlopenHelperFlag_FTServices))
    return dlopenHelper_FTServices(result);
  return result;
}

void gotLoadHelper_x21__OBJC_CLASS___ACOAuthSigner(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Accounts))
    dlopenHelper_Accounts(a1);
}

void gotLoadHelper_x21__OBJC_CLASS___AVAssetDownloadConfiguration(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AVFoundation))
    dlopenHelper_AVFoundation(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___ACAccountStore(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Accounts))
    return dlopenHelper_Accounts(result);
  return result;
}

double gotLoadHelper_x8__kMobileKeyBagLockStatusNotifyToken(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileKeyBag))
    return dlopenHelper_MobileKeyBag(result);
  return result;
}

double gotLoadHelper_x8__CPCopyBundleIdentifierAndTeamFromSecTaskRef(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_AppSupport))
    return dlopenHelper_AppSupport(result);
  return result;
}

void gotLoadHelper_x22__OBJC_CLASS___PrivacyProxyClient(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_NetworkServiceProxy))
    dlopenHelper_NetworkServiceProxy(a1);
}

