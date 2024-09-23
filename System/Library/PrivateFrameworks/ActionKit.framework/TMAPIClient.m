@implementation TMAPIClient

- (void)authenticate:(id)a3 urlBlock:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[TMTumblrAuthenticator sharedInstance](TMTumblrAuthenticator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__TMAPIClient_authenticate_urlBlock_callback___block_invoke;
  v13[3] = &unk_24F8B6348;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "authenticate:urlBlock:callback:", v10, v9, v13);

}

- (BOOL)handleOpenURL:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[TMTumblrAuthenticator sharedInstance](TMTumblrAuthenticator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handleOpenURL:", v3);

  return v5;
}

- (void)xAuth:(id)a3 password:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[TMTumblrAuthenticator sharedInstance](TMTumblrAuthenticator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__TMAPIClient_xAuth_password_callback___block_invoke;
  v13[3] = &unk_24F8B6348;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "xAuth:password:callback:", v10, v9, v13);

}

- (void)setOAuthConsumerKey:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[TMTumblrAuthenticator sharedInstance](TMTumblrAuthenticator, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOAuthConsumerKey:", v3);

}

- (NSString)OAuthConsumerKey
{
  void *v2;
  void *v3;

  +[TMTumblrAuthenticator sharedInstance](TMTumblrAuthenticator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "OAuthConsumerKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setOAuthConsumerSecret:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[TMTumblrAuthenticator sharedInstance](TMTumblrAuthenticator, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOAuthConsumerSecret:", v3);

}

- (NSString)OAuthConsumerSecret
{
  void *v2;
  void *v3;

  +[TMTumblrAuthenticator sharedInstance](TMTumblrAuthenticator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "OAuthConsumerSecret");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)userInfoRequest
{
  return -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", CFSTR("user/info"), 0);
}

- (void)userInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TMAPIClient userInfoRequest](self, "userInfoRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v5, v4);

}

- (id)dashboardRequest:(id)a3
{
  return -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", CFSTR("user/dashboard"), a3);
}

- (void)dashboard:(id)a3 callback:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TMAPIClient dashboardRequest:](self, "dashboardRequest:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v7, v6);

}

- (id)likesRequest:(id)a3
{
  return -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", CFSTR("user/likes"), a3);
}

- (void)likes:(id)a3 callback:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TMAPIClient likesRequest:](self, "likesRequest:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v7, v6);

}

- (id)followingRequest:(id)a3
{
  return -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", CFSTR("user/following"), a3);
}

- (void)following:(id)a3 callback:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TMAPIClient followingRequest:](self, "followingRequest:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v7, v6);

}

- (id)followRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("url");
  fullBlogName(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", CFSTR("user/follow"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)follow:(id)a3 callback:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TMAPIClient followRequest:](self, "followRequest:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v7, v6);

}

- (id)unfollowRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("url");
  fullBlogName(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", CFSTR("user/unfollow"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)unfollow:(id)a3 callback:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TMAPIClient unfollowRequest:](self, "unfollowRequest:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v7, v6);

}

- (id)likeRequest:(id)a3 reblogKey:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("id");
  v12[1] = CFSTR("reblog_key");
  v13[0] = a3;
  v13[1] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", CFSTR("user/like"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)like:(id)a3 reblogKey:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient likeRequest:reblogKey:](self, "likeRequest:reblogKey:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)unlikeRequest:(id)a3 reblogKey:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("id");
  v12[1] = CFSTR("reblog_key");
  v13[0] = a3;
  v13[1] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", CFSTR("user/unlike"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)unlike:(id)a3 reblogKey:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient unlikeRequest:reblogKey:](self, "unlikeRequest:reblogKey:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (void)avatar:(id)a3 size:(unint64_t)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[TMAPIClient defaultCallbackQueue](self, "defaultCallbackQueue");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient avatar:size:queue:callback:](self, "avatar:size:queue:callback:", v9, a4, v10, v8);

}

- (void)avatar:(id)a3 size:(unint64_t)a4 queue:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  blogPath(CFSTR("avatar"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("/%ld"), a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__31118;
    v25[4] = __Block_byref_object_dispose__31119;
    v26 = _Block_copy(v12);
    v16 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke;
    v22[3] = &unk_24F8B6370;
    v17 = v11;
    v23 = v17;
    v24 = v25;
    objc_msgSend(v15, "setDidFinishLoadingBlock:", v22);
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke_3;
    v19[3] = &unk_24F8B6370;
    v20 = v17;
    v21 = v25;
    objc_msgSend(v15, "setDidFailBlock:", v19);

    _Block_object_dispose(v25, 8);
  }
  -[TMAPIClient queue](self, "queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v15);

}

- (id)blogInfoRequest:(id)a3
{
  void *v4;
  void *v5;

  blogPath(CFSTR("info"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)blogInfo:(id)a3 callback:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TMAPIClient blogInfoRequest:](self, "blogInfoRequest:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v7, v6);

}

- (id)followersRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  blogPath(CFSTR("followers"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)followers:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient followersRequest:parameters:](self, "followersRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)postsRequest:(id)a3 type:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  blogPath(CFSTR("posts"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("/%@"), v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)posts:(id)a3 type:(id)a4 parameters:(id)a5 callback:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  -[TMAPIClient postsRequest:type:parameters:](self, "postsRequest:type:parameters:", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v11, v10);

}

- (id)queueRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  blogPath(CFSTR("posts/queue"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)queue:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient queueRequest:parameters:](self, "queueRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)draftsRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  blogPath(CFSTR("posts/draft"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)drafts:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient draftsRequest:parameters:](self, "draftsRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)submissionsRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  blogPath(CFSTR("posts/submission"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)submissions:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient submissionsRequest:parameters:](self, "submissionsRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)likesRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  blogPath(CFSTR("likes"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)likes:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient likesRequest:parameters:](self, "likesRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)postRequest:(id)a3 type:(id)a4 parameters:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithDictionary:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

  blogPath(CFSTR("post"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)post:(id)a3 type:(id)a4 parameters:(id)a5 callback:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  -[TMAPIClient postRequest:type:parameters:](self, "postRequest:type:parameters:", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v11, v10);

}

- (id)editPostRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  blogPath(CFSTR("post/edit"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)editPost:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient editPostRequest:parameters:](self, "editPostRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)reblogPostRequest:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  blogPath(CFSTR("post/reblog"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)reblogPost:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient reblogPostRequest:parameters:](self, "reblogPostRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)deletePostRequest:(id)a3 id:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  blogPath(CFSTR("post/delete"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("id");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TMAPIClient postRequestWithPath:parameters:](self, "postRequestWithPath:parameters:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)deletePost:(id)a3 id:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient deletePostRequest:id:](self, "deletePostRequest:id:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)textRequest:(id)a3 parameters:(id)a4
{
  return -[TMAPIClient postRequest:type:parameters:](self, "postRequest:type:parameters:", a3, CFSTR("text"), a4);
}

- (void)text:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient textRequest:parameters:](self, "textRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)quoteRequest:(id)a3 parameters:(id)a4
{
  return -[TMAPIClient postRequest:type:parameters:](self, "postRequest:type:parameters:", a3, CFSTR("quote"), a4);
}

- (void)quote:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient quoteRequest:parameters:](self, "quoteRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)linkRequest:(id)a3 parameters:(id)a4
{
  return -[TMAPIClient postRequest:type:parameters:](self, "postRequest:type:parameters:", a3, CFSTR("link"), a4);
}

- (void)link:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient linkRequest:parameters:](self, "linkRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)chatRequest:(id)a3 parameters:(id)a4
{
  return -[TMAPIClient postRequest:type:parameters:](self, "postRequest:type:parameters:", a3, CFSTR("chat"), a4);
}

- (void)chat:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient chatRequest:parameters:](self, "chatRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)photoRequest:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6 parameters:(id)a7
{
  return -[TMAPIClient multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:](self, "multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:", a3, CFSTR("photo"), a7, a4, a5, a6);
}

- (void)photo:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6 parameters:(id)a7 callback:(id)a8
{
  id v14;
  id v15;

  v14 = a8;
  -[TMAPIClient photoRequest:filePathArray:contentTypeArray:fileNameArray:parameters:](self, "photoRequest:filePathArray:contentTypeArray:fileNameArray:parameters:", a3, a4, a5, a6, a7);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v15, v14);

}

- (id)videoRequest:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v24[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    if (v14)
    {
LABEL_3:
      v23 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  v18 = 0;
  if (v15)
  {
LABEL_4:
    v22 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TMAPIClient multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:](self, "multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:", v12, CFSTR("video"), v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  -[TMAPIClient multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:](self, "multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:", v12, CFSTR("video"), v16, v17, v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
LABEL_5:

LABEL_6:
  if (v13)

  return v20;
}

- (void)video:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7 callback:(id)a8
{
  id v14;
  id v15;

  v14 = a8;
  -[TMAPIClient videoRequest:filePath:contentType:fileName:parameters:](self, "videoRequest:filePath:contentType:fileName:parameters:", a3, a4, a5, a6, a7);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v15, v14);

}

- (id)audioRequest:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v24[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    if (v14)
    {
LABEL_3:
      v23 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  v18 = 0;
  if (v15)
  {
LABEL_4:
    v22 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TMAPIClient multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:](self, "multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:", v12, CFSTR("audio"), v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  -[TMAPIClient multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:](self, "multipartPostRequest:type:parameters:filePathArray:contentTypeArray:fileNameArray:", v12, CFSTR("audio"), v16, v17, v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
LABEL_5:

LABEL_6:
  if (v13)

  return v20;
}

- (void)audio:(id)a3 filePath:(id)a4 contentType:(id)a5 fileName:(id)a6 parameters:(id)a7 callback:(id)a8
{
  id v14;
  id v15;

  v14 = a8;
  -[TMAPIClient audioRequest:filePath:contentType:fileName:parameters:](self, "audioRequest:filePath:contentType:fileName:parameters:", a3, a4, a5, a6, a7);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v15, v14);

}

- (id)taggedRequest:(id)a3 parameters:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("tag"));

  -[TMAPIClient getRequestWithPath:parameters:](self, "getRequestWithPath:parameters:", CFSTR("tagged"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)tagged:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[TMAPIClient taggedRequest:parameters:](self, "taggedRequest:parameters:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:callback:](self, "sendRequest:callback:", v9, v8);

}

- (id)getRequestWithPath:(id)a3 parameters:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthConsumerKey](self, "OAuthConsumerKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("api_key"));

  -[TMAPIClient URLWithPath:](self, "URLWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[JXHTTPOperation withURLString:queryParameters:](JXHTTPOperation, "withURLString:queryParameters:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TMAPIClient timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v11, "setRequestTimeoutInterval:");
  -[TMAPIClient signRequest:withParameters:](self, "signRequest:withParameters:", v11, 0);

  return v11;
}

- (id)postRequestWithPath:(id)a3 parameters:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthConsumerKey](self, "OAuthConsumerKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("api_key"));

  -[TMAPIClient URLWithPath:](self, "URLWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[JXHTTPOperation withURLString:](JXHTTPOperation, "withURLString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setRequestMethod:", CFSTR("POST"));
  +[JXHTTPFormEncodedBody withDictionary:](JXHTTPFormEncodedBody, "withDictionary:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequestBody:", v12);

  -[TMAPIClient timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v11, "setRequestTimeoutInterval:");
  -[TMAPIClient signRequest:withParameters:](self, "signRequest:withParameters:", v11, v8);

  return v11;
}

- (id)multipartPostRequest:(id)a3 type:(id)a4 parameters:(id)a5 filePathArray:(id)a6 contentTypeArray:(id)a7 fileNameArray:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v14 = (void *)MEMORY[0x24BDBCED8];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v14, "dictionaryWithDictionary:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthConsumerKey](self, "OAuthConsumerKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("api_key"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("type"));
  blogPath(CFSTR("post"), v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[TMAPIClient URLWithPath:](self, "URLWithPath:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[JXHTTPOperation withURLString:](JXHTTPOperation, "withURLString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setRequestMethod:", CFSTR("POST"));
  -[TMAPIClient multipartBodyForParameters:filePathArray:contentTypeArray:fileNameArray:](self, "multipartBodyForParameters:filePathArray:contentTypeArray:fileNameArray:", v20, v17, v16, v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setRequestBody:", v25);
  -[TMAPIClient timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v24, "setRequestTimeoutInterval:");
  -[TMAPIClient signRequest:withParameters:](self, "signRequest:withParameters:", v24, v20);

  return v24;
}

- (id)multipartBodyForParameters:(id)a3 filePathArray:(id)a4 contentTypeArray:(id)a5 fileNameArray:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  char v27;

  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDBCED8];
  v13 = a4;
  objc_msgSend(v12, "dictionaryWithDictionary:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthConsumerKey](self, "OAuthConsumerKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("api_key"));

  +[JXHTTPMultipartBody withDictionary:](JXHTTPMultipartBody, "withDictionary:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = (unint64_t)objc_msgSend(v13, "count") > 1;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __87__TMAPIClient_multipartBodyForParameters_filePathArray_contentTypeArray_fileNameArray___block_invoke;
  v23[3] = &unk_24F8B6398;
  v17 = v16;
  v27 = (char)self;
  v24 = v17;
  v25 = v10;
  v26 = v11;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v23);

  v20 = v26;
  v21 = v17;

  return v21;
}

- (void)signRequest:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[TMSDKUserAgent userAgentHeaderString](TMSDKUserAgent, "userAgentHeaderString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forRequestHeader:", v8, CFSTR("User-Agent"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TMAPIClient customHeaders](self, "customHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        -[TMAPIClient customHeaders](self, "customHeaders");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forRequestHeader:", v16, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "requestURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestMethod");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthConsumerKey](self, "OAuthConsumerKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthConsumerSecret](self, "OAuthConsumerSecret");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthToken](self, "OAuthToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient OAuthTokenSecret](self, "OAuthTokenSecret");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[TMOAuth headerForURL:method:postParameters:nonce:consumerKey:consumerSecret:token:tokenSecret:](TMOAuth, "headerForURL:method:postParameters:nonce:consumerKey:consumerSecret:token:tokenSecret:", v17, v18, v7, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forRequestHeader:", v24, CFSTR("Authorization"));

}

- (void)sendRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TMAPIClient defaultCallbackQueue](self, "defaultCallbackQueue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TMAPIClient sendRequest:queue:callback:](self, "sendRequest:queue:callback:", v7, v8, v6);

}

- (void)sendRequest:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__31118;
    v24[4] = __Block_byref_object_dispose__31119;
    v25 = _Block_copy(v10);
    v12 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __42__TMAPIClient_sendRequest_queue_callback___block_invoke;
    v21[3] = &unk_24F8B6370;
    v13 = v9;
    v22 = v13;
    v23 = v24;
    objc_msgSend(v8, "setDidFinishLoadingBlock:", v21);
    v15 = v12;
    v16 = 3221225472;
    v17 = __42__TMAPIClient_sendRequest_queue_callback___block_invoke_3;
    v18 = &unk_24F8B6370;
    v19 = v13;
    v20 = v24;
    objc_msgSend(v8, "setDidFailBlock:", &v15);

    _Block_object_dispose(v24, 8);
  }
  -[TMAPIClient queue](self, "queue", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v8);

}

- (id)URLWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TMAPIClient baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (TMAPIClient)init
{
  TMAPIClient *v2;
  JXHTTPOperationQueue *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TMAPIClient;
  v2 = -[TMAPIClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(JXHTTPOperationQueue);
    -[TMAPIClient setQueue:](v2, "setQueue:", v3);

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TMAPIClient setDefaultCallbackQueue:](v2, "setDefaultCallbackQueue:", v4);

    -[TMAPIClient setTimeoutInterval:](v2, "setTimeoutInterval:", 60.0);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.tumblr.com/v2/"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TMAPIClient setBaseURL:](v2, "setBaseURL:", v5);

  }
  return v2;
}

- (NSString)OAuthToken
{
  return self->_OAuthToken;
}

- (void)setOAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)OAuthTokenSecret
{
  return self->_OAuthTokenSecret;
}

- (void)setOAuthTokenSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)customHeaders
{
  return self->_customHeaders;
}

- (void)setCustomHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (JXHTTPOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSOperationQueue)defaultCallbackQueue
{
  return self->_defaultCallbackQueue;
}

- (void)setDefaultCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultCallbackQueue, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_defaultCallbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_customHeaders, 0);
  objc_storeStrong((id *)&self->_OAuthTokenSecret, 0);
  objc_storeStrong((id *)&self->_OAuthToken, 0);
}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  objc_msgSend(a2, "responseJSON");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("meta"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v5 = (void *)v4;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("meta"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if ((v8 - 200) >= 0x64)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Request failed"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = 0;
LABEL_6:
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__TMAPIClient_sendRequest_queue_callback___block_invoke_2;
  v14[3] = &unk_24F8B9FF0;
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v16 = v9;
  v17 = v10;
  v15 = v3;
  v12 = v9;
  v13 = v3;
  objc_msgSend(v11, "addOperationWithBlock:", v14);

}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TMAPIClient_sendRequest_queue_callback___block_invoke_4;
  v7[3] = &unk_24F8BB688;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __42__TMAPIClient_sendRequest_queue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("response"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __87__TMAPIClient_multipartBodyForParameters_filePathArray_contentTypeArray_fileNameArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data[%lu]"), a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("data");
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFile:forKey:contentType:fileName:", v10, v7, v8, v9);

  if (v6)
}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if ((unint64_t)(objc_msgSend(v3, "responseStatusCode") - 200) > 0x63)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = objc_msgSend(v3, "responseStatusCode");

    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("Request failed"), v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "responseData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke_2;
  v12[3] = &unk_24F8B9FF0;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v13 = v4;
  v10 = v5;
  v11 = v4;
  objc_msgSend(v9, "addOperationWithBlock:", v12);

}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TMAPIClient_avatar_size_queue_callback___block_invoke_4;
  v7[3] = &unk_24F8BB688;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __42__TMAPIClient_avatar_size_queue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __39__TMAPIClient_xAuth_password_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v9 = a4;
  v8 = a3;
  objc_msgSend(v7, "setOAuthToken:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setOAuthTokenSecret:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __46__TMAPIClient_authenticate_urlBlock_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v9 = a4;
  v8 = a3;
  objc_msgSend(v7, "setOAuthToken:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setOAuthTokenSecret:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (TMAPIClient)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__TMAPIClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate_31230 != -1)
    dispatch_once(&sharedInstance_predicate_31230, block);
  return (TMAPIClient *)(id)sharedInstance_instance_31231;
}

void __29__TMAPIClient_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_31231;
  sharedInstance_instance_31231 = (uint64_t)v1;

}

@end
